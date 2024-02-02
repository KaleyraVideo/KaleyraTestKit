// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import XCTest
import SwiftHamcrest
import KaleyraTestKit
@testable import KaleyraSnapshotTest

final class Device_SizeClassesTests: UnitTestCase {

    override func setUp() {
        super.setUp()

        continueAfterFailure = true
    }

    func testScreenSizeClassesForAlliPhoneDevicesInPortraitOrientation() {
        let orientation = Screen.Orientation.portrait
        let expected = Screen.SizeClasses(horizontal: .compact, vertical: .regular)

        assertThatModelSizeClasses(.iPhoneSE, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhoneSE2ndGen, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone5s, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone6, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone6Plus, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone6s, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone6sPlus, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone7, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone7Plus, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone8, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone8Plus, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhoneX, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhoneXs, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhoneXr, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhoneXsMax, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone11, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone11Pro, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone11ProMax, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone12, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone12Pro, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone12ProMax, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone12Mini, forOrientation: orientation, equalTo: expected)
    }

    func testScreenSizeClassesForiPhone6sPlusAndTheLikeInLandscapeOrientation() {
        let orientation = Screen.Orientation.landscape
        let expected = Screen.SizeClasses(horizontal: .regular, vertical: .compact)

        assertThatModelSizeClasses(.iPhone6Plus, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone6sPlus, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone7Plus, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone8Plus, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhoneXr, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhoneXsMax, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone11, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone11ProMax, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone12ProMax, forOrientation: orientation, equalTo: expected)
    }

    func testScreenSizeClassesForiPhone6AndTheLikeInLandscapeOrientation() {
        let orientation = Screen.Orientation.landscape
        let expected = Screen.SizeClasses(horizontal: .compact, vertical: .compact)

        assertThatModelSizeClasses(.iPhoneSE, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhoneSE2ndGen, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone5s, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone6, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone6s, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone7, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone8, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhoneX, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhoneXs, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone11Pro, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone12, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone12Pro, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPhone12Mini, forOrientation: orientation, equalTo: expected)
    }

    func testScreenSizeClassesForAlliPadDevicesInPortraitOrientation() {
        let orientation = Screen.Orientation.portrait
        let expected = Screen.SizeClasses(horizontal: .regular, vertical: .regular)

        assertThatModelSizeClasses(.iPad5thGen, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad6thGen, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad7thGen, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad8thGen, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir2, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir3rdGen, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadMini4thGen, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadMini5thGen, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro9_7, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro10_5, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro11, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro12_9, forOrientation: orientation, equalTo: expected)
    }

    func testScreenSizeClassesForAlliPadDevicesInLandscapeOrientation() {
        let orientation = Screen.Orientation.landscape
        let expected = Screen.SizeClasses(horizontal: .regular, vertical: .regular)

        assertThatModelSizeClasses(.iPad5thGen, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad6thGen, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad7thGen, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad8thGen, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir2, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir3rdGen, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadMini4thGen, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadMini5thGen, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro9_7, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro10_5, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro11, forOrientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro12_9, forOrientation: orientation, equalTo: expected)
    }

    func testScreenSizeClassesForMultitaskingForAlliPadsInPortraitOrientationForOneThirdSplit() {
        let orientation = Screen.Orientation.portrait
        let mode = Screen.MultitaskingMode.oneThird
        let expected = Screen.SizeClasses(horizontal: .compact, vertical: .regular)

        assertThatModelSizeClasses(.iPad5thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad6thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad7thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad8thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir2, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir3rdGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadMini4thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadMini5thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro9_7, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro10_5, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro11, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro12_9, multitaskingMode: mode, orientation: orientation, equalTo: expected)
    }

    func testScreenSizeClassesForMultitaskingForAlliPadsInPortraitOrientationForTwoThirdSplit() {
        let orientation = Screen.Orientation.portrait
        let mode = Screen.MultitaskingMode.twoThird
        let expected = Screen.SizeClasses(horizontal: .compact, vertical: .regular)

        assertThatModelSizeClasses(.iPad5thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad6thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad7thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad8thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir2, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir3rdGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadMini4thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadMini5thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro9_7, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro10_5, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro11, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro12_9, multitaskingMode: mode, orientation: orientation, equalTo: expected)
    }

    func testScreenSizeClassesForMultitaskingShouldThrowAnErrorForAlliPadsInPortraitOrientationForHalfSplit() {
        let orientation = Screen.Orientation.portrait
        let mode = Screen.MultitaskingMode.half
        let error = NotAvailableMultitaskingModeError()

        assertThrows(.iPad5thGen, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPad6thGen, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPad7thGen, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPad8thGen, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPadAir, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPadAir2, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPadAir3rdGen, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPadMini4thGen, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPadMini5thGen, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPadPro9_7, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPadPro10_5, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPadPro11, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPadPro12_9, multitaskingMode: mode, orientation: orientation, error: error)
    }

    func testScreenSizeClassesForMultitaskingForAlliPadsInLandscapeOrientationForOneThirdSplit() {
        let orientation = Screen.Orientation.landscape
        let mode = Screen.MultitaskingMode.oneThird
        let expected = Screen.SizeClasses(horizontal: .compact, vertical: .regular)

        assertThatModelSizeClasses(.iPad5thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad6thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad7thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad8thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir2, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir3rdGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadMini4thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadMini5thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro9_7, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro10_5, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro11, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro12_9, multitaskingMode: mode, orientation: orientation, equalTo: expected)
    }

    func testScreenSizeClassesForMultitaskingForAlliPadsButiPad12_9InLandscapeOrientationForHalfSplit() {
        let orientation = Screen.Orientation.landscape
        let mode = Screen.MultitaskingMode.half
        let expected = Screen.SizeClasses(horizontal: .compact, vertical: .regular)

        assertThatModelSizeClasses(.iPad5thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad6thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad7thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad8thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir2, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir3rdGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadMini4thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadMini5thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro9_7, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro10_5, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro11, multitaskingMode: mode, orientation: orientation, equalTo: expected)
    }

    func testScreenSizeClassesForMultitaskingForiPad12_9InLandscapeOrientationForHalfSplit() {
        let orientation = Screen.Orientation.landscape
        let mode = Screen.MultitaskingMode.half
        let expected = Screen.SizeClasses(horizontal: .regular, vertical: .regular)

        assertThatModelSizeClasses(.iPadPro12_9, multitaskingMode: mode, orientation: orientation, equalTo: expected)
    }

    func testScreenSizeClassesForMultitaskingForAlliPadsInLandscapeOrientationForTwoThirdSplit() {
        let orientation = Screen.Orientation.landscape
        let mode = Screen.MultitaskingMode.twoThird
        let expected = Screen.SizeClasses(horizontal: .regular, vertical: .regular)

        assertThatModelSizeClasses(.iPad5thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad6thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad7thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPad8thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir2, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadAir3rdGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadMini4thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadMini5thGen, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro9_7, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro10_5, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro11, multitaskingMode: mode, orientation: orientation, equalTo: expected)
        assertThatModelSizeClasses(.iPadPro12_9, multitaskingMode: mode, orientation: orientation, equalTo: expected)
    }

    func testScreenSizeClassesForMultitaskingShouldThrowAnErrorForAlliPhoneDevices() {
        let orientation = Screen.Orientation.portrait
        let mode = Screen.MultitaskingMode.oneThird
        let error = NotAvailableMultitaskingModeError()

        assertThrows(.iPhone5s, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhoneSE, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhone6, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhone6s, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhone7, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhone8, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhoneSE2ndGen, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhone6Plus, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhone6sPlus, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhone7Plus, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhone8Plus, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhoneX, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhoneXr, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhoneXs, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhoneXsMax, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhone11, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhone11Pro, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhone11ProMax, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhone12Mini, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhone12, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhone12Pro, multitaskingMode: mode, orientation: orientation, error: error)
        assertThrows(.iPhone12ProMax, multitaskingMode: mode, orientation: orientation, error: error)
    }

    // MARK: Assertions

    private func assertThatModelSizeClasses(_ model: Device.Model,
                                            forOrientation orientation: Screen.Orientation,
                                            equalTo expected: Screen.SizeClasses,
                                            file: StaticString = #filePath,
                                            line: UInt = #line) {
        assertThat(try Device(model: model).screenSizeClassesFor(orientation: orientation, multitaskingMode: nil), equalTo(expected), file: file, line: line)
    }

    private func assertThatModelSizeClasses(_ model: Device.Model,
                                            multitaskingMode mode: Screen.MultitaskingMode,
                                            orientation: Screen.Orientation,
                                            equalTo expected: Screen.SizeClasses,
                                            file: StaticString = #filePath,
                                            line: UInt = #line) {
        assertThat(try Device(model: model).screenSizeClassesFor(orientation: orientation, multitaskingMode: mode), equalTo(expected), file: file, line: line)
    }

    private func assertThrows<AnError: Error>(_ model: Device.Model,
                                              multitaskingMode mode: Screen.MultitaskingMode,
                                              orientation: Screen.Orientation,
                                              error: AnError,
                                              file: String = #filePath,
                                              line: UInt = #line) where AnError: Equatable {
        SwiftHamcrest.assertThrows(try Device(model: model).screenSizeClassesFor(orientation: orientation, multitaskingMode: mode), error, file: file, line: line)
    }
}
