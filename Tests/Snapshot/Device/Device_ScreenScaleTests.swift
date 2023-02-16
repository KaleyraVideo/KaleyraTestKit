// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import XCTest
#if canImport(Hamcrest)
import Hamcrest
#elseif canImport(SwiftHamcrest)
import SwiftHamcrest
#endif
import BandyerTestKit

final class Device_ScreenScaleTests: UnitTestCase {

    override func setUp() {
        super.setUp()

        continueAfterFailure = true
    }

    func testScreenScaleForiPhone5sAndTheLike() {
        let expected = Screen.Scale.x2

        assertThatScreenScale(.iPhone5s, equalTo: expected)
        assertThatScreenScale(.iPhoneSE, equalTo: expected)
        assertThatScreenScale(.iPhone6, equalTo: expected)
        assertThatScreenScale(.iPhone6s, equalTo: expected)
        assertThatScreenScale(.iPhone7, equalTo: expected)
        assertThatScreenScale(.iPhone8, equalTo: expected)
        assertThatScreenScale(.iPhoneXr, equalTo: expected)
        assertThatScreenScale(.iPhone11, equalTo: expected)
        assertThatScreenScale(.iPhoneSE2ndGen, equalTo: expected)
    }

    func testScreenScaleForiPhone12AndTheLike() {
        let expected = Screen.Scale.x3

        assertThatScreenScale(.iPhone6Plus, equalTo: expected)
        assertThatScreenScale(.iPhone6sPlus, equalTo: expected)
        assertThatScreenScale(.iPhone7Plus, equalTo: expected)
        assertThatScreenScale(.iPhone8Plus, equalTo: expected)
        assertThatScreenScale(.iPhoneX, equalTo: expected)
        assertThatScreenScale(.iPhoneXs, equalTo: expected)
        assertThatScreenScale(.iPhoneXsMax, equalTo: expected)
        assertThatScreenScale(.iPhone11Pro, equalTo: expected)
        assertThatScreenScale(.iPhone11ProMax, equalTo: expected)
        assertThatScreenScale(.iPhone12Mini, equalTo: expected)
        assertThatScreenScale(.iPhone12, equalTo: expected)
        assertThatScreenScale(.iPhone12Pro, equalTo: expected)
        assertThatScreenScale(.iPhone12ProMax, equalTo: expected)
    }

    func testScreenScaleForiPad() {
        let expected = Screen.Scale.x2

        assertThatScreenScale(.iPad5thGen, equalTo: expected)
        assertThatScreenScale(.iPad6thGen, equalTo: expected)
        assertThatScreenScale(.iPad7thGen, equalTo: expected)
        assertThatScreenScale(.iPad8thGen, equalTo: expected)
        assertThatScreenScale(.iPadAir, equalTo: expected)
        assertThatScreenScale(.iPadAir2, equalTo: expected)
        assertThatScreenScale(.iPadAir3rdGen, equalTo: expected)
        assertThatScreenScale(.iPadMini4thGen, equalTo: expected)
        assertThatScreenScale(.iPadMini5thGen, equalTo: expected)
        assertThatScreenScale(.iPadPro9_7, equalTo: expected)
        assertThatScreenScale(.iPadPro10_5, equalTo: expected)
        assertThatScreenScale(.iPadPro11, equalTo: expected)
        assertThatScreenScale(.iPadPro12_9, equalTo: expected)
    }

    // MARK: Assertions

    private func assertThatScreenScale(_ model: Device.Model, equalTo scale: Screen.Scale, file: StaticString = #filePath, line: UInt = #line) {
        assertThat(Device(model: model).screenScale, equalTo(scale), file: file, line: line)
    }

}
