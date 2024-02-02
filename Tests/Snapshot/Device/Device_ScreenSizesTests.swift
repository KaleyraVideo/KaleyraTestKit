// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import XCTest
import SwiftHamcrest
import KaleyraTestKit
import KaleyraSnapshotTest

final class Device_ScreenSizesTests: UnitTestCase {

    override func setUp() {
        super.setUp()

        continueAfterFailure = true
    }

    func testScreenSizeForiPhone5sAndTheLike() {
        let expectedSize = CGSize(width: 320, height: 568)

        assertThatScreenSize(.iPhone5s, equalTo: expectedSize)
        assertThatScreenSize(.iPhoneSE, equalTo: expectedSize)
    }

    func testScreenSizeForiPhone8AndTheLike() {
        let expectedSize = CGSize(width: 375, height: 667)

        assertThatScreenSize(.iPhone6, equalTo: expectedSize)
        assertThatScreenSize(.iPhone6s, equalTo: expectedSize)
        assertThatScreenSize(.iPhone7, equalTo: expectedSize)
        assertThatScreenSize(.iPhone8, equalTo: expectedSize)
        assertThatScreenSize(.iPhoneSE2ndGen, equalTo: expectedSize)
    }

    func testScreenSizeForiPhone8PlusAndTheLike() {
        let expectedSize = CGSize(width: 414, height: 763)

        assertThatScreenSize(.iPhone6Plus, equalTo: expectedSize)
        assertThatScreenSize(.iPhone6sPlus, equalTo: expectedSize)
        assertThatScreenSize(.iPhone7Plus, equalTo: expectedSize)
        assertThatScreenSize(.iPhone8Plus, equalTo: expectedSize)
    }

    func testScreenSizeForiPhoneXAndTheLike() {
        let expectedSize = CGSize(width: 375, height: 812)

        assertThatScreenSize(.iPhoneX, equalTo: expectedSize)
        assertThatScreenSize(.iPhoneXs, equalTo: expectedSize)
        assertThatScreenSize(.iPhone11Pro, equalTo: expectedSize)
        assertThatScreenSize(.iPhone12Mini, equalTo: expectedSize)
    }

    func testScreenSizeForiPhoneXrAndTheLike() {
        let expectedSize = CGSize(width: 414, height: 896)

        assertThatScreenSize(.iPhoneXr, equalTo: expectedSize)
        assertThatScreenSize(.iPhoneXsMax, equalTo: expectedSize)
        assertThatScreenSize(.iPhone11, equalTo: expectedSize)
        assertThatScreenSize(.iPhone11ProMax, equalTo: expectedSize)
    }

    func testScreenSizeForiPhone12AndTheLike() {
        let expectedSize = CGSize(width: 390, height: 844)

        assertThatScreenSize(.iPhone12, equalTo: expectedSize)
        assertThatScreenSize(.iPhone12Pro, equalTo: expectedSize)
    }

    func testScreeSizeForiPhone12ProMax() {
        let expectedSize = CGSize(width: 428, height: 926)

        assertThatScreenSize(.iPhone12ProMax, equalTo: expectedSize)
    }

    func testScreenSizeForiPad9_7AndTheLike() {
        let expectedSize = CGSize(width: 768, height: 1024)

        assertThatScreenSize(.iPadPro9_7, equalTo: expectedSize)
        assertThatScreenSize(.iPadMini4thGen, equalTo: expectedSize)
        assertThatScreenSize(.iPadMini5thGen, equalTo: expectedSize)
        assertThatScreenSize(.iPad5thGen, equalTo: expectedSize)
        assertThatScreenSize(.iPad6thGen, equalTo: expectedSize)
        assertThatScreenSize(.iPadAir, equalTo: expectedSize)
        assertThatScreenSize(.iPadAir2, equalTo: expectedSize)
    }

    func testScreenSizeForiPad7thGenAndTheLike() {
        let expectedSize = CGSize(width: 810, height: 1080)

        assertThatScreenSize(.iPad7thGen, equalTo: expectedSize)
        assertThatScreenSize(.iPad8thGen, equalTo: expectedSize)
    }

    func testScreenSizeForiPadPro10_5AndTheLike() {
        let expectedSize = CGSize(width: 834, height: 1112)

        assertThatScreenSize(.iPadPro10_5, equalTo: expectedSize)
        assertThatScreenSize(.iPadAir3rdGen, equalTo: expectedSize)
    }

    func testScreenSizeForiPadPro11AndTheLike() {
        let expectedSize = CGSize(width: 834, height: 1194)

        assertThatScreenSize(.iPadPro11, equalTo: expectedSize)
    }

    func testScreenSizeForiPadPro12_9AndTheLike() {
        let expectedSize = CGSize(width: 1024, height: 1366)

        assertThatScreenSize(.iPadPro12_9, equalTo: expectedSize)
    }

    // MARK: Assertions

    private func assertThatScreenSize(_ model: Device.Model, equalTo expected: CGSize, file: StaticString = #filePath, line: UInt = #line) {
        assertThat(Device(model: model).screenSize, equalTo(expected), file: file, line: line)
    }
}
