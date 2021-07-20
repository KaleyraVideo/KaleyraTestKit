// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import Foundation
import XCTest
import FBSnapshotTestCase

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
        let testName = NSStringFromSelector(invocation!.selector)
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

    public func verifySnapshot(_ viewController: UIViewController, devices: [Device], variants: SnapshotVariant.Builder, compatibleWith uidevice: UIDevice = .current, tolerance: SnapshotTolerance = .zero, identifier: String? = nil, file: StaticString = #filePath, line: UInt = #line) {
        let compatibleDevices = devices.compatible(with: uidevice).uniqueByScreenSize()
        guard !compatibleDevices.isEmpty else {
            record(XCTIssue(type: .assertionFailure, compactDescription: "Could not find compatible devices to run the tests against"))
            return
        }
        verifySnapshot(viewController, devices: compatibleDevices, variants: variants, tolerance: tolerance, identifier: identifier, file: file, line: line)
    }

    public  func verifySnapshot(_ viewController: UIViewController, runStrategy: SnapshotTestCaseRunStrategy = .auto, variants: SnapshotVariant.Builder = .default, tolerance: SnapshotTolerance = .zero, identifier: String? = nil, file: StaticString = #filePath, line: UInt = #line) {
        let devices = runStrategy.devices
        verifySnapshot(viewController, devices: devices, variants: variants, compatibleWith: .current, tolerance: tolerance, identifier: identifier, file: file, line: line)
    }
}
