// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE for licensing information

import Foundation
import XCTest
import iOSSnapshotTestCase

open class SnapshotTestCase: FBSnapshotTestCase {

    open override func setUp() {
        super.setUp()

        if ProcessInfo.processInfo.environment["RECORD_SNAPSHOTS"] == "true" {
            self.recordMode = true
        }

        UIView.setAnimationsEnabled(false)
    }

    open override func tearDown() {
        UIView.setAnimationsEnabled(true)

        super.tearDown()
    }

    public func verifySnapshot(_ viewController: UIViewController, configuration: SnapshotConfiguration, tolerance: SnapshotTolerance = .zero, identifier: String? = nil, file: StaticString = #filePath, line: UInt = #line) {
        let host = SnapshotHost(configuration: configuration)
        host.rootViewController = viewController
        host.isHidden = false

        FBSnapshotVerifyView(host, identifier: identifier, perPixelTolerance: tolerance.perPixel, overallTolerance: tolerance.overall, file: file, line: line)
    }

    public func verifySnapshot(_ viewController: UIViewController, device: Device, variants: SnapshotVariant.Builder, tolerance: SnapshotTolerance = .zero, identifier: String? = nil, file: StaticString = #filePath, line: UInt = #line) {
        let testClass = NSStringFromClass(type(of: self))
        let testName = NSStringFromSelector(invocation!.selector).replacingOccurrences(of: ":", with: "_")
        folderName = "\(UIDevice.current.systemName)/\(UIDevice.current.systemVersion)/\(testClass)/\(testName)/\(device.name)"
        let allVariants = variants.build()
        var skippedVariants = 0

        for variant in allVariants {
            autoreleasepool {
                do {
                    let config = try variant.configuration(for: device)
                    let fileIdentifier = "\(identifier != nil ? identifier! + "-" : "")\(variant.description)"
                    verifySnapshot(viewController, configuration: config, tolerance: tolerance, identifier: fileIdentifier, file: file, line: line)
                } catch is NotAvailableMultitaskingModeError, is UnsupportedSnapshotConfigurationError {
                    skippedVariants += 1
                } catch {
                    record(XCTIssue(type: .thrownError, compactDescription: error.localizedDescription))
                }
            }
        }

        if allVariants.count == skippedVariants {
            record(XCTIssue(type: .assertionFailure, compactDescription: "All variants have been skipped, no test has actually run"))
        }
    }

    public func verifySnapshot(_ viewController: UIViewController, devices: [Device], variants: SnapshotVariant.Builder, tolerance: SnapshotTolerance = .zero, identifier: String? = nil, file: StaticString = #filePath, line: UInt = #line) {
        guard !devices.isEmpty else {
            record(XCTIssue(type: .assertionFailure, compactDescription: "Provided an empty list of devices to run the tests against"))
            return
        }
        devices.forEach { device in
            verifySnapshot(viewController, device: device, variants: variants, tolerance: tolerance, identifier: identifier, file: file, line: line)
        }
    }

    public func verifySnapshot(_ viewController: UIViewController, devices: [Device], variants: SnapshotVariant.Builder, compatibleWithUIDevice uidevice: UIDevice = .current, compatibleWithUIScreen screen: UIScreen = .main, tolerance: SnapshotTolerance = .zero, identifier: String? = nil, file: StaticString = #filePath, line: UInt = #line) {
        guard let scale = Screen.Scale(screen) else {
            record(XCTIssue(type: .assertionFailure, compactDescription: "Unsupported screen scale"))
            return
        }
        let compatibleDevices = devices
            .compatible(with: uidevice)
            .compatible(with: scale)
            .uniqueByScreenSize()
        guard !compatibleDevices.isEmpty else {
            record(XCTIssue(type: .assertionFailure, compactDescription: "Could not find compatible devices to run the tests against"))
            return
        }
        verifySnapshot(viewController, devices: compatibleDevices, variants: variants, tolerance: tolerance, identifier: identifier, file: file, line: line)
    }

    public  func verifySnapshot(_ viewController: UIViewController, runStrategy: SnapshotTestCaseRunStrategy = .auto, variants: SnapshotVariant.Builder = .default, tolerance: SnapshotTolerance = .zero, identifier: String? = nil, file: StaticString = #filePath, line: UInt = #line) {
        let devices = runStrategy.devices
        verifySnapshot(viewController, devices: devices, variants: variants, compatibleWithUIDevice: .current, compatibleWithUIScreen: .main, tolerance: tolerance, identifier: identifier, file: file, line: line)
    }
}

private extension FBSnapshotTestCase {

    func FBSnapshotVerifyView(_ view: UIView, identifier: String? = nil, suffixes: NSOrderedSet = FBSnapshotTestCaseDefaultSuffixes(), perPixelTolerance: CGFloat = 0, overallTolerance: CGFloat = 0, file: StaticString = #file, line: UInt = #line) {
        FBSnapshotVerifyViewOrLayer(view, identifier: identifier, suffixes: suffixes, perPixelTolerance: perPixelTolerance, overallTolerance: overallTolerance, file: file, line: line)
    }

    private func FBSnapshotVerifyViewOrLayer(_ viewOrLayer: AnyObject, identifier: String? = nil, suffixes: NSOrderedSet = FBSnapshotTestCaseDefaultSuffixes(), perPixelTolerance: CGFloat = 0, overallTolerance: CGFloat = 0, file: StaticString = #file, line: UInt = #line) {
        let envReferenceImageDirectory = self.getReferenceImageDirectory(withDefault: nil)
        let envImageDiffDirectory = self.getImageDiffDirectory(withDefault: nil)
        var error: NSError?
        var comparisonSuccess = false

        for suffix in suffixes {
            let referenceImagesDirectory = "\(envReferenceImageDirectory)\(suffix)"
            let imageDiffDirectory = envImageDiffDirectory
            if viewOrLayer.isKind(of: UIView.self) {
                do {
                    try compareSnapshot(of: viewOrLayer as! UIView, referenceImagesDirectory: referenceImagesDirectory, imageDiffDirectory: imageDiffDirectory, identifier: identifier, perPixelTolerance: perPixelTolerance, overallTolerance: overallTolerance)
                    comparisonSuccess = true
                } catch let error1 as NSError {
                    error = error1
                    comparisonSuccess = false
                }
            } else if viewOrLayer.isKind(of: CALayer.self) {
                do {
                    try compareSnapshot(of: viewOrLayer as! CALayer, referenceImagesDirectory: referenceImagesDirectory, imageDiffDirectory: imageDiffDirectory, identifier: identifier, perPixelTolerance: perPixelTolerance, overallTolerance: overallTolerance)
                    comparisonSuccess = true
                } catch let error1 as NSError {
                    error = error1
                    comparisonSuccess = false
                }
            } else {
                assertionFailure("Only UIView and CALayer classes can be snapshotted")
            }

            assert(recordMode == false, message: "Test ran in record mode. Reference image is now saved. Disable record mode to perform an actual snapshot comparison!", file: file, line: line)

            if comparisonSuccess || recordMode {
                break
            }

            assert(comparisonSuccess, message: "Snapshot comparison failed: \(String(describing: error))", file: file, line: line)
        }
    }

    func assert(_ assertion: Bool, message: String, file: StaticString, line: UInt) {
        if !assertion {
            XCTFail(message, file: file, line: line)
        }
    }
}
