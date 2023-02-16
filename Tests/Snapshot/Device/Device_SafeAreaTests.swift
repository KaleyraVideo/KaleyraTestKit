// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import XCTest
#if canImport(Hamcrest)
import Hamcrest
#elseif canImport(SwiftHamcrest)
import SwiftHamcrest
#endif
import BandyerTestKit

final class Device_SafeAreaTests: UnitTestCase {

    override func setUp() {
        super.setUp()

        continueAfterFailure = true
    }

    func testSafeAreaInPortraitModeForiPhone5sAndTheLike() {
        let orientation = Screen.Orientation.portrait
        let expected = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)

        assertThatSafeArea(.iPhone5s, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhoneSE, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone6, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone6s, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone7, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone8, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhoneSE2ndGen, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone6Plus, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone6sPlus, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone7Plus, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone8Plus, orientation: orientation, equalTo: expected)
    }

    func testSafeAreaInPortraitModeForiPhoneXAndTheLike() {
        let orientation = Screen.Orientation.portrait
        let expected = UIEdgeInsets(top: 44.0, left: 0.0, bottom: 34.0, right: 0.0)

        assertThatSafeArea(.iPhoneX, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhoneXr, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhoneXs, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhoneXsMax, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone11Pro, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone11ProMax, orientation: orientation, equalTo: expected)
    }

    func testSafeAreaInPortraitModeForiPhone11() {
        let orientation = Screen.Orientation.portrait
        let expected = UIEdgeInsets(top: 48.0, left: 0.0, bottom: 34.0, right: 0.0)

        assertThatSafeArea(.iPhone11, orientation: orientation, equalTo: expected)
    }

    func testSafeAreaInPortraitModeForiPhone12AndTheLike() {
        let orientation = Screen.Orientation.portrait
        let expected = UIEdgeInsets(top: 47.0, left: 0.0, bottom: 34.0, right: 0.0)

        assertThatSafeArea(.iPhone12, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone12Pro, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone12ProMax, orientation: orientation, equalTo: expected)
    }

    func testSafeAreaInPortraitModeForiPhone12Mini() {
        let orientation = Screen.Orientation.portrait
        let expected = UIEdgeInsets(top: 50.0, left: 0.0, bottom: 34.0, right: 0.0)

        assertThatSafeArea(.iPhone12Mini, orientation: orientation, equalTo: expected)
    }

    func testSafeAreaInPortraitModeForiPadAndTheLike() {
        let orientation = Screen.Orientation.portrait
        let expected = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)

        assertThatSafeArea(.iPadMini4thGen, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPadMini5thGen, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPadAir, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPadAir2, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPadAir3rdGen, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPad5thGen, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPad6thGen, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPad7thGen, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPad8thGen, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPadPro10_5, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPadPro9_7, orientation: orientation, equalTo: expected)
    }

    func testSafeAreaInPortraitModeForiPadPro11AndTheLike() {
        let orientation = Screen.Orientation.portrait
        let expected = UIEdgeInsets(top: 24.0, left: 0.0, bottom: 20.0, right: 0.0)

        assertThatSafeArea(.iPadPro11, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPadPro12_9, orientation: orientation, equalTo: expected)
    }

    func testSafeAreaInLandscapeModeForiPhone5sAndTheLike() {
        let orientation = Screen.Orientation.landscape
        let expected = UIEdgeInsets.zero

        assertThatSafeArea(.iPhone5s, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhoneSE, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone6, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone6s, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone7, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone8, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhoneSE2ndGen, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone6Plus, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone6sPlus, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone7Plus, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone8Plus, orientation: orientation, equalTo: expected)
    }

    func testSafeAreaInLandscapeModeForiPhoneXAndTheLike() {
        let orientation = Screen.Orientation.landscape
        let expected = UIEdgeInsets(top: 0.0, left: 44.0, bottom: 21.0, right: 44.0)

        assertThatSafeArea(.iPhoneX, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhoneXr, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhoneXs, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhoneXsMax, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone11Pro, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone11ProMax, orientation: orientation, equalTo: expected)
    }

    func testSafeAreaInLandscapeModeForiPhone11() {
        let orientation = Screen.Orientation.landscape
        let expected = UIEdgeInsets(top: 0.0, left: 48.0, bottom: 21.0, right: 48.0)

        assertThatSafeArea(.iPhone11, orientation: orientation, equalTo: expected)
    }

    func testSafeAreaInLandscapeModeForiPhone12AndTheLike() {
        let orientation = Screen.Orientation.landscape
        let expected = UIEdgeInsets(top: 0.0, left: 47.0, bottom: 21.0, right: 47.0)

        assertThatSafeArea(.iPhone12, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone12Pro, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPhone12ProMax, orientation: orientation, equalTo: expected)
    }

    func testSafeAreaInLandscapeModeForiPhone12Mini() {
        let orientation = Screen.Orientation.landscape
        let expected = UIEdgeInsets(top: 0.0, left: 50.0, bottom: 21.0, right: 50.0)

        assertThatSafeArea(.iPhone12Mini, orientation: orientation, equalTo: expected)
    }

    func testSafeAreaInLandscapeModeForiPadAndTheLike() {
        let orientation = Screen.Orientation.landscape
        let expected = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)

        assertThatSafeArea(.iPadMini4thGen, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPadMini5thGen, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPadAir, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPadAir2, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPadAir3rdGen, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPad5thGen, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPad6thGen, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPad7thGen, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPad8thGen, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPadPro10_5, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPadPro9_7, orientation: orientation, equalTo: expected)
    }

    func testSafeAreaInLandscapeModeForiPadPro11AndTheLike() {
        let orientation = Screen.Orientation.landscape
        let expected = UIEdgeInsets(top: 24.0, left: 0.0, bottom: 20.0, right: 0.0)

        assertThatSafeArea(.iPadPro11, orientation: orientation, equalTo: expected)
        assertThatSafeArea(.iPadPro12_9, orientation: orientation, equalTo: expected)
    }

    // MARK: Assertions

    private func assertThatSafeArea(_ model: Device.Model, orientation: Screen.Orientation, equalTo expected: UIEdgeInsets, file: StaticString = #filePath, line: UInt = #line) {
        assertThat(Device(model: model).safeAreaInsetsFor(orientation: orientation), equalTo(expected), file: file, line: line)
    }
}
