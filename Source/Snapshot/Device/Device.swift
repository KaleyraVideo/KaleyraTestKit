// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import Foundation
import CoreGraphics

public struct Device: Equatable {

    public enum Family {
        case phone
        case pad
    }

    public enum Model: String, CaseIterable {
        case iPhone5s
        case iPhoneSE
        case iPhone6
        case iPhone6s
        case iPhone7
        case iPhone8
        case iPhoneSE2ndGen
        case iPhone6Plus
        case iPhone6sPlus
        case iPhone7Plus
        case iPhone8Plus
        case iPhoneX
        case iPhoneXr
        case iPhoneXs
        case iPhoneXsMax
        case iPhone11
        case iPhone11Pro
        case iPhone11ProMax
        case iPhone12Mini
        case iPhone12
        case iPhone12Pro
        case iPhone12ProMax

        case iPad5thGen
        case iPad6thGen
        case iPad7thGen
        case iPad8thGen
        case iPadAir
        case iPadAir2
        case iPadAir3rdGen
        case iPadMini4thGen
        case iPadMini5thGen
        case iPadPro9_7
        case iPadPro10_5
        case iPadPro11
        case iPadPro12_9
    }

    public let model: Model

    public var name: String {
        model.rawValue
    }

    public var screenSize: CGSize {
        switch model {
            case .iPhone5s, .iPhoneSE:
                return .init(width: 320, height: 568)
            case .iPhone6, .iPhone6s, .iPhone7, .iPhone8, .iPhoneSE2ndGen:
                return .init(width: 375, height: 667)
            case .iPhone6Plus, .iPhone6sPlus, .iPhone7Plus, .iPhone8Plus:
                return .init(width: 414, height: 763)
            case .iPhoneX, .iPhoneXs, .iPhone11Pro, .iPhone12Mini:
                return .init(width: 375, height: 812)
            case .iPhoneXr, .iPhoneXsMax, .iPhone11, .iPhone11ProMax:
                return .init(width: 414, height: 896)
            case .iPhone12, .iPhone12Pro:
                return .init(width: 390, height: 844)
            case .iPhone12ProMax:
                return .init(width: 428, height: 926)
            case .iPad5thGen, .iPad6thGen, .iPadMini4thGen, .iPadPro9_7, .iPadAir, .iPadAir2, .iPadMini5thGen:
                return .init(width: 768, height: 1024)
            case .iPad7thGen, .iPad8thGen:
                return .init(width: 810, height: 1080)
            case .iPadPro10_5, .iPadAir3rdGen:
                return .init(width: 834, height: 1112)
            case .iPadPro11:
                return .init(width: 834, height: 1194)
            case .iPadPro12_9:
                return .init(width: 1024, height: 1366)
        }
    }

    public var screenScale: Screen.Scale {
        switch model {
            case .iPhone5s, .iPhoneSE, .iPhone6, .iPhone6s, .iPhone7, .iPhone8, .iPhoneXr, .iPhone11, .iPhoneSE2ndGen:
                return .x2
            case .iPhone6Plus, .iPhone6sPlus, .iPhone7Plus, .iPhone8Plus, .iPhoneX, .iPhoneXs, .iPhoneXsMax, .iPhone11Pro, .iPhone11ProMax,.iPhone12Mini, .iPhone12, .iPhone12Pro, .iPhone12ProMax:
                return .x3
            case .iPad5thGen, .iPad6thGen, .iPad7thGen, .iPad8thGen, .iPadAir, .iPadAir2, .iPadAir3rdGen, .iPadMini4thGen, .iPadPro9_7, .iPadPro10_5, .iPadPro11, .iPadPro12_9, .iPadMini5thGen:
                return .x2
        }
    }

    public var family: Family {
        switch model {
            case .iPhone5s, .iPhoneSE, .iPhone6, .iPhone6s, .iPhone7, .iPhone8, .iPhoneSE2ndGen, .iPhone6Plus, .iPhone6sPlus, .iPhone7Plus, .iPhone8Plus, .iPhoneX, .iPhoneXr, .iPhoneXs, .iPhoneXsMax, .iPhone11, .iPhone11Pro, .iPhone11ProMax, .iPhone12Mini, .iPhone12, .iPhone12Pro, .iPhone12ProMax:
                return .phone
            case .iPad5thGen, .iPad6thGen, .iPad7thGen, .iPad8thGen, .iPadAir,.iPadAir2, .iPadAir3rdGen, .iPadMini4thGen, .iPadPro9_7, .iPadPro10_5, .iPadPro11, .iPadPro12_9, .iPadMini5thGen:
                return .pad
        }
    }

    public var operatingSystems: Range<Version> {
        switch model {
            case .iPhone5s:
                return Version(7) ..< Version(13)
            case .iPhoneSE:
                return Version(9, 3) ..< Version.max
            case .iPhone6, .iPhone6Plus:
                return Version(8, 0) ..< Version(13)
            case .iPhone6s, .iPhone6sPlus:
                return Version(9, 0) ..< Version(15)
            case .iPhone7, .iPhone7Plus:
                return Version(10, 0) ..< Version.max
            case .iPhone8, .iPhone8Plus, .iPhoneX:
                return Version(11, 0) ..< Version.max
            case .iPhoneSE2ndGen:
                return Version(13, 4) ..< Version.max
            case .iPhoneXr, .iPhoneXs, .iPhoneXsMax:
                return Version(12, 0) ..< Version.max
            case .iPhone11, .iPhone11Pro, .iPhone11ProMax:
                return Version(13, 0) ..< Version.max
            case .iPhone12Mini, .iPhone12ProMax:
                return Version(14, 2) ..< Version.max
            case .iPhone12, .iPhone12Pro:
                return Version(14, 1) ..< Version.max
            case .iPad5thGen:
                return Version(10, 2) ..< Version.max
            case .iPad6thGen:
                return Version(11, 3) ..< Version.max
            case .iPad7thGen:
                return Version(13, 1) ..< Version.max
            case .iPad8thGen:
                return Version(14, 0) ..< Version.max
            case .iPadAir:
                return Version(7, 0) ..< Version(13)
            case .iPadAir2:
                return Version(8, 1) ..< Version.max
            case .iPadAir3rdGen:
                return Version(12, 2) ..< Version.max
            case .iPadMini4thGen:
                return Version(9, 0) ..< Version.max
            case .iPadMini5thGen:
                return Version(12, 2) ..< Version.max
            case .iPadPro9_7:
                return Version(9, 3) ..< Version.max
            case .iPadPro10_5:
                return Version(10, 3) ..< Version.max
            case .iPadPro11:
                return Version(12, 1) ..< Version.max
            case .iPadPro12_9:
                return Version(9, 1) ..< Version.max
        }
    }

    public init(model: Model) {
        self.model = model
    }

    public static let all: [Device] = Device.Model.allCases.compactMap({ Device(model: $0)})

    public static let allPhones = [Device(model: .iPhone5s),
                                    Device(model: .iPhoneSE),
                                    Device(model: .iPhone6),
                                    Device(model: .iPhone6s),
                                    Device(model: .iPhone7),
                                    Device(model: .iPhone8),
                                    Device(model: .iPhoneSE2ndGen),
                                    Device(model: .iPhone6Plus),
                                    Device(model: .iPhone6sPlus),
                                    Device(model: .iPhone7Plus),
                                    Device(model: .iPhone8Plus),
                                    Device(model: .iPhoneX),
                                    Device(model: .iPhoneXr),
                                    Device(model: .iPhoneXs),
                                    Device(model: .iPhoneXsMax),
                                    Device(model: .iPhone11),
                                    Device(model: .iPhone11Pro),
                                    Device(model: .iPhone11ProMax),
                                    Device(model: .iPhone12Mini),
                                    Device(model: .iPhone12),
                                    Device(model: .iPhone12Pro),
                                    Device(model: .iPhone12ProMax),]

    public static let allPads = [Device(model: .iPad5thGen),
                                  Device(model: .iPad6thGen),
                                  Device(model: .iPad7thGen),
                                  Device(model: .iPad8thGen),
                                  Device(model: .iPadAir),
                                  Device(model: .iPadAir2),
                                  Device(model: .iPadAir3rdGen),
                                  Device(model: .iPadMini4thGen),
                                  Device(model: .iPadMini5thGen),
                                  Device(model: .iPadPro9_7),
                                  Device(model: .iPadPro10_5),
                                  Device(model: .iPadPro11),
                                  Device(model: .iPadPro12_9),]
}
