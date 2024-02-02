// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import XCTest
import SwiftHamcrest
import KaleyraTestKit
import KaleyraSnapshotTest

final class Device_MultitaskingModesTests: UnitTestCase {

    func testMultitaskingModesShouldReturnAllCasesForiPadDevice() {
        let device = Device(model: .iPadPro11)

        assertThat(device.multitaskingModes, equalTo(Screen.MultitaskingMode.allCases))
    }

    func testMultitaskingModesShouldReturnEmptyArrayForiPhoneDevice() {
        let device = Device(model: .iPhone8)

        assertThat(device.multitaskingModes, empty())
    }

    func testMultitaskingModesShouldReturnEmptyArrayForiPhoneDeviceOnAnyOrientation() {
        let device = Device(model: .iPhone8)

        assertThat(device.multitaskingModes(for: .portrait), empty())
        assertThat(device.multitaskingModes(for: .landscape), empty())
    }

    func testMultitaskingModesForPortraitOrientationShouldReturnOneThirdAndTwoThirdGiveniPadDevice() {
        let device = Device(model: .iPadPro11)

        assertThat(device.multitaskingModes(for: .portrait), equalTo([.oneThird, .twoThird]))
    }

    func testMultitaskingModesForLandscapeOrientationShouldReturnAllModesGiveniPadDevice() {
        let device = Device(model: .iPadPro11)

        assertThat(device.multitaskingModes(for: .landscape), equalTo(Screen.MultitaskingMode.allCases))
    }
}
