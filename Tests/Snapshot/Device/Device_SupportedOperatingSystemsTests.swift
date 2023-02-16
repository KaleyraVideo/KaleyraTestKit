// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import XCTest
#if canImport(Hamcrest)
import Hamcrest
#elseif canImport(SwiftHamcrest)
import SwiftHamcrest
#endif
import BandyerTestKit

class Device_SupportedOperatingSystemsTests: UnitTestCase {

    override func setUp() {
        super.setUp()

        continueAfterFailure = true
    }

    func testSupportedOperatingSystemsForiPhone5s() {
        let expected = Version(7) ..< Version(13)

        assertThatModel(.iPhone5s, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPhoneSE() {
        let expected = Version(9, 3) ..< Version.max

        assertThatModel(.iPhoneSE, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPhone6AndTheLike() {
        let expected = Version(8) ..< Version(13)

        assertThatModel(.iPhone6, supportedOperatingSystemsAre: expected)
        assertThatModel(.iPhone6Plus, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPhone6sAndTheLike() {
        let expected = Version(9, 0) ..< Version(15)

        assertThatModel(.iPhone6s, supportedOperatingSystemsAre: expected)
        assertThatModel(.iPhone6sPlus, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPhone7AndTheLike() {
        let expected = Version(10) ..< Version.max

        assertThatModel(.iPhone7, supportedOperatingSystemsAre: expected)
        assertThatModel(.iPhone7Plus, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPhone8AndTheLike() {
        let expected = Version(11, 0) ..< Version.max

        assertThatModel(.iPhone8, supportedOperatingSystemsAre: expected)
        assertThatModel(.iPhone8Plus, supportedOperatingSystemsAre: expected)
        assertThatModel(.iPhoneX, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPhoneXsAndTheLike() {
        let expected = Version(12, 0) ..< Version.max

        assertThatModel(.iPhoneXs, supportedOperatingSystemsAre: expected)
        assertThatModel(.iPhoneXsMax, supportedOperatingSystemsAre: expected)
        assertThatModel(.iPhoneXr, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPhone11AndTheLike() {
        let expected = Version(13, 0) ..< Version.max

        assertThatModel(.iPhone11, supportedOperatingSystemsAre: expected)
        assertThatModel(.iPhone11Pro, supportedOperatingSystemsAre: expected)
        assertThatModel(.iPhone11ProMax, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPhoneSE2ndGenAndTheLike() {
        let expected = Version(13, 4) ..< Version.max

        assertThatModel(.iPhoneSE2ndGen, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPhone12AndTheLike() {
        let expected = Version(14, 1) ..< Version.max

        assertThatModel(.iPhone12, supportedOperatingSystemsAre: expected)
        assertThatModel(.iPhone12Pro, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPhone12MiniAndTheLike() {
        let expected = Version(14, 2) ..< Version.max

        assertThatModel(.iPhone12Mini, supportedOperatingSystemsAre: expected)
        assertThatModel(.iPhone12ProMax, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPad5thGen() {
        let expected = Version(10, 2)..<Version.max

        assertThatModel(.iPad5thGen, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPad6thGen() {
        let expected = Version(11, 3)..<Version.max

        assertThatModel(.iPad6thGen, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPad7thGen() {
        let expected = Version(13, 1)..<Version.max

        assertThatModel(.iPad7thGen, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPad8thGen() {
        let expected = Version(14, 0)..<Version.max

        assertThatModel(.iPad8thGen, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPadAir() {
        let expected = Version(7, 0)..<Version(13, 0)

        assertThatModel(.iPadAir, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPadAir2() {
        let expected = Version(8, 1)..<Version.max

        assertThatModel(.iPadAir2, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPadAir3rdGen() {
        let expected = Version(12, 2)..<Version.max

        assertThatModel(.iPadAir3rdGen, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPadMini4thGen() {
        let expected = Version(9, 0)..<Version.max

        assertThatModel(.iPadMini4thGen, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPadMini5thGen() {
        let expected = Version(12, 2)..<Version.max

        assertThatModel(.iPadMini5thGen, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPadPro9_7() {
        let expected = Version(9, 3)..<Version.max

        assertThatModel(.iPadPro9_7, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPadPro12_9() {
        let expected = Version(9, 1)..<Version.max

        assertThatModel(.iPadPro12_9, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPadPro10_5() {
        let expected = Version(10, 3)..<Version.max

        assertThatModel(.iPadPro10_5, supportedOperatingSystemsAre: expected)
    }

    func testSupportedOperatingSystemsForiPadPro11() {
        let expected = Version(12, 1)..<Version.max

        assertThatModel(.iPadPro11, supportedOperatingSystemsAre: expected)
    }

    // MARK: Assertions

    private func assertThatModel(_ model: Device.Model, supportedOperatingSystemsAre range: Range<Version>, file: StaticString = #filePath, line: UInt = #line) {
        assertThat(Device(model: model).operatingSystems, equalTo(range), file: file, line: line)
    }
}
