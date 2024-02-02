// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import XCTest
import SwiftHamcrest
import KaleyraTestKit
@testable import KaleyraSnapshotTest

final class Device_FamilyTests: UnitTestCase {

    override func setUp() {
        super.setUp()

        continueAfterFailure = true
    }

    func testFamilyForiPhoneDevices() {
        let expected = Device.Family.phone

        assertThatModelFamily(.iPhone5s, equalTo: expected)
        assertThatModelFamily(.iPhoneSE, equalTo: expected)
        assertThatModelFamily(.iPhone6, equalTo: expected)
        assertThatModelFamily(.iPhone6s, equalTo: expected)
        assertThatModelFamily(.iPhone7, equalTo: expected)
        assertThatModelFamily(.iPhone8, equalTo: expected)
        assertThatModelFamily(.iPhoneSE2ndGen, equalTo: expected)
        assertThatModelFamily(.iPhone6Plus, equalTo: expected)
        assertThatModelFamily(.iPhone6sPlus, equalTo: expected)
        assertThatModelFamily(.iPhone7Plus, equalTo: expected)
        assertThatModelFamily(.iPhone8Plus, equalTo: expected)
        assertThatModelFamily(.iPhoneX, equalTo: expected)
        assertThatModelFamily(.iPhoneXr, equalTo: expected)
        assertThatModelFamily(.iPhoneXs, equalTo: expected)
        assertThatModelFamily(.iPhoneXsMax, equalTo: expected)
        assertThatModelFamily(.iPhone11, equalTo: expected)
        assertThatModelFamily(.iPhone11Pro, equalTo: expected)
        assertThatModelFamily(.iPhone11ProMax, equalTo: expected)
        assertThatModelFamily(.iPhone12Mini, equalTo: expected)
        assertThatModelFamily(.iPhone12, equalTo: expected)
        assertThatModelFamily(.iPhone12Pro, equalTo: expected)
        assertThatModelFamily(.iPhone12ProMax, equalTo: expected)
    }

    func testFamilyForiPadDevices() {
        let expected = Device.Family.pad

        assertThatModelFamily(.iPad5thGen, equalTo: expected)
        assertThatModelFamily(.iPad6thGen, equalTo: expected)
        assertThatModelFamily(.iPad7thGen, equalTo: expected)
        assertThatModelFamily(.iPad8thGen, equalTo: expected)
        assertThatModelFamily(.iPadAir, equalTo: expected)
        assertThatModelFamily(.iPadAir2, equalTo: expected)
        assertThatModelFamily(.iPadAir3rdGen, equalTo: expected)
        assertThatModelFamily(.iPadMini4thGen, equalTo: expected)
        assertThatModelFamily(.iPadMini5thGen, equalTo: expected)
        assertThatModelFamily(.iPadPro9_7, equalTo: expected)
        assertThatModelFamily(.iPadPro10_5, equalTo: expected)
        assertThatModelFamily(.iPadPro11, equalTo: expected)
        assertThatModelFamily(.iPadPro12_9, equalTo: expected)
    }

    // MARK: Assertion

    private func assertThatModelFamily(_ model: Device.Model, equalTo expected: Device.Family, file: StaticString = #filePath, line: UInt = #line) {
        assertThat(Device(model: model).family, equalTo(expected), file: file, line: line)
    }
}
