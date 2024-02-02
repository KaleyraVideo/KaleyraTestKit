// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import XCTest
#if canImport(Hamcrest)
import Hamcrest
#elseif canImport(SwiftHamcrest)
import SwiftHamcrest
#endif
import BandyerTestKit

final class DeviceTests: UnitTestCase {

    func testAllDevices() {
        let devices = Device.all
        let models = devices.models

        assertThat(models, equalTo(Device.Model.allCases))
    }

    func testAllPhones() {
        let devices = Device.allPhones
        let models = devices.models

        assertThat(models, containsInAnyOrder(
                    .iPhone5s,
                    .iPhoneSE,
                    .iPhone6,
                    .iPhone6s,
                    .iPhone7,
                    .iPhone8,
                    .iPhoneSE2ndGen,
                    .iPhone6Plus,
                    .iPhone6sPlus,
                    .iPhone7Plus,
                    .iPhone8Plus,
                    .iPhoneX,
                    .iPhoneXr,
                    .iPhoneXs,
                    .iPhoneXsMax,
                    .iPhone11,
                    .iPhone11Pro,
                    .iPhone11ProMax,
                    .iPhone12Mini,
                    .iPhone12,
                    .iPhone12Pro,
                    .iPhone12ProMax
            ))
    }

    func testAllPads() {
        let devices = Device.allPads
        let models = devices.models

        assertThat(models, containsInAnyOrder(
            .iPad5thGen,
            .iPad6thGen,
            .iPad7thGen,
            .iPad8thGen,
            .iPadAir,
            .iPadAir2,
            .iPadAir3rdGen,
            .iPadMini4thGen,
            .iPadMini5thGen,
            .iPadPro9_7,
            .iPadPro10_5,
            .iPadPro11,
            .iPadPro12_9
        ))
    }

    func testAllPhonesCompatibleWithVersionShouldReturnAnArrayOfPhonesCompatibleWithTheVersionProvided() {
        let version = Version(major: 13, minor: 0)

        let devices = Device.allPhones.compatible(with: version)
        let models = devices.models

        assertThat(models, containsInAnyOrder(
            .iPhoneSE,
            .iPhone6s,
            .iPhone7,
            .iPhone8,
            .iPhone6sPlus,
            .iPhone7Plus,
            .iPhone8Plus,
            .iPhoneX,
            .iPhoneXr,
            .iPhoneXs,
            .iPhoneXsMax,
            .iPhone11,
            .iPhone11Pro,
            .iPhone11ProMax
        ))
    }

    func testAllPadsCompatibleWithVersionShouldReturnAnArrayOfPadsCompatibleWithTheVersionProvided() {
        let version = Version(major: 13, minor: 0)

        let devices = Device.allPads.compatible(with: version)
        let models = devices.models

        assertThat(models, containsInAnyOrder(
            .iPad5thGen,
            .iPad6thGen,
            .iPadAir2,
            .iPadAir3rdGen,
            .iPadMini4thGen,
            .iPadMini5thGen,
            .iPadPro9_7,
            .iPadPro10_5,
            .iPadPro11,
            .iPadPro12_9
        ))
    }

    func testAllPhonesCompatibleWithScreenScaleX3() {
        let screenScale = Screen.Scale.x3

        let devices = Device.allPhones.compatible(with: screenScale)
        let models = devices.models

        assertThat(models, containsInAnyOrder(
            .iPhone6Plus,
            .iPhone6sPlus,
            .iPhone7Plus,
            .iPhone8Plus,
            .iPhoneX,
            .iPhoneXs,
            .iPhoneXsMax,
            .iPhone11Pro,
            .iPhone11ProMax,
            .iPhone12Mini,
            .iPhone12,
            .iPhone12Pro,
            .iPhone12ProMax
        ))
    }

    func testAllDevicesCompatibleWithPhoneUIUserInterfaceIdiom() {
        let devices = Device.all.compatible(with: UIUserInterfaceIdiom.phone)
        let models = devices.models

        assertThat(models, containsInAnyOrder(
            .iPhone5s,
            .iPhoneSE,
            .iPhone6,
            .iPhone6s,
            .iPhone7,
            .iPhone8,
            .iPhoneSE2ndGen,
            .iPhone6Plus,
            .iPhone6sPlus,
            .iPhone7Plus,
            .iPhone8Plus,
            .iPhoneX,
            .iPhoneXr,
            .iPhoneXs,
            .iPhoneXsMax,
            .iPhone11,
            .iPhone11Pro,
            .iPhone11ProMax,
            .iPhone12Mini,
            .iPhone12,
            .iPhone12Pro,
            .iPhone12ProMax
        ))
    }

    func testAllDevicesCompatibleWithPadUIUserInterfaceIdiom() {
        let devices = Device.all.compatible(with: UIUserInterfaceIdiom.pad)
        let models = devices.models

        assertThat(models, containsInAnyOrder(
            .iPad5thGen,
            .iPad6thGen,
            .iPad7thGen,
            .iPad8thGen,
            .iPadAir,
            .iPadAir2,
            .iPadAir3rdGen,
            .iPadMini4thGen,
            .iPadMini5thGen,
            .iPadPro9_7,
            .iPadPro10_5,
            .iPadPro11,
            .iPadPro12_9
        ))
    }

    func testAllDevicesCompatibleWithUIDevice() {
        let fakeDevice = FakeUIDevice()
        fakeDevice.overriddenSystemVersion = "13.1"
        fakeDevice.overriddenIdiom = .pad

        let devices = Device.all.compatible(with: fakeDevice)
        let models = devices.models

        assertThat(models, containsInAnyOrder(
            .iPad5thGen,
            .iPad6thGen,
            .iPad7thGen,
            .iPadAir2,
            .iPadAir3rdGen,
            .iPadMini4thGen,
            .iPadMini5thGen,
            .iPadPro9_7,
            .iPadPro10_5,
            .iPadPro11,
            .iPadPro12_9
        ))
    }

    func testUniqueShouldReturnAllDevicesWithDifferentScreenSizes() {
        let devices = [
            Device(model: .iPhone6),
            Device(model: .iPhone6s),
            Device(model: .iPhone7),
            Device(model: .iPhone8),
            Device(model: .iPhone8Plus),
            Device(model: .iPhoneX),
            Device(model: .iPhoneXs),
        ].uniqueByScreenSize()
        let models = devices.models

        assertThat(models, hasCount(3))
        assertThat(models, containsInAnyOrder(
            .iPhone6,
            .iPhone8Plus,
            .iPhoneX
        ))
    }
}

private class FakeUIDevice: UIDevice {

    var overriddenSystemVersion: String?
    var overriddenIdiom: UIUserInterfaceIdiom?

    override var systemVersion: String {
        get {
            guard let overriddenValue = overriddenSystemVersion else {
                return super.systemVersion
            }
            return overriddenValue
        }
    }

    override var userInterfaceIdiom: UIUserInterfaceIdiom {
        get {
            guard let overriddenValue = overriddenIdiom else { return super.userInterfaceIdiom }
            return overriddenValue
        }
    }
}

