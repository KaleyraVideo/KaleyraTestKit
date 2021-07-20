// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import Foundation
import UIKit

public extension Device {

    func safeAreaInsetsFor(orientation: Screen.Orientation) -> UIEdgeInsets {
        switch orientation {
            case .portrait:
                return safeAreaInsetsForPortrait()
            case .landscape:
                return safeAreaInsetsForLandscape()
        }
    }

    private func safeAreaInsetsForPortrait() -> UIEdgeInsets {
        switch model {
            case .iPhone5s, .iPhoneSE, .iPhone6, .iPhone6s, .iPhone7, .iPhone8, .iPhoneSE2ndGen, .iPhone6Plus, .iPhone6sPlus, .iPhone7Plus,.iPhone8Plus:
                return .init(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)
            case .iPhoneX, .iPhoneXr, .iPhoneXs, .iPhoneXsMax, .iPhone11Pro, .iPhone11ProMax:
                return .init(top: 44.0, left: 0.0, bottom: 34.0, right: 0.0)
            case .iPhone11:
                return .init(top: 48.0, left: 0.0, bottom: 34.0, right: 0.0)
            case .iPhone12Mini:
                return .init(top: 50.0, left: 0.0, bottom: 34.0, right: 0.0)
            case .iPhone12, .iPhone12Pro, .iPhone12ProMax:
                return .init(top: 47.0, left: 0.0, bottom: 34.0, right: 0.0)
            case .iPad5thGen, .iPad6thGen, .iPad7thGen, .iPad8thGen, .iPadAir, .iPadAir2, .iPadAir3rdGen, .iPadMini4thGen, .iPadMini5thGen, .iPadPro9_7, .iPadPro10_5 :
                return .init(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)
            case .iPadPro11, .iPadPro12_9:
                return .init(top: 24.0, left: 0.0, bottom: 20.0, right: 0.0)
        }
    }

    private func safeAreaInsetsForLandscape() -> UIEdgeInsets {
        switch model {
            case .iPhone5s, .iPhoneSE, .iPhone6, .iPhone6s, .iPhone7, .iPhone8, .iPhoneSE2ndGen, .iPhone6Plus, .iPhone6sPlus, .iPhone7Plus,.iPhone8Plus:
                return .zero
            case .iPhoneX, .iPhoneXr, .iPhoneXs, .iPhoneXsMax, .iPhone11Pro, .iPhone11ProMax:
                return .init(top: 0.0, left: 44.0, bottom: 21.0, right: 44.0)
            case .iPhone11:
                return .init(top: 0.0, left: 48.0, bottom: 21.0, right: 48.0)
            case .iPhone12Mini:
                return .init(top: 0.0, left: 50.0, bottom: 21.0, right: 50.0)
            case .iPhone12, .iPhone12Pro, .iPhone12ProMax:
                return .init(top: 0.0, left: 47.0, bottom: 21.0, right: 47.0)
            case .iPad5thGen, .iPad6thGen, .iPad7thGen, .iPad8thGen, .iPadAir, .iPadAir2, .iPadAir3rdGen, .iPadMini4thGen, .iPadMini5thGen, .iPadPro9_7, .iPadPro10_5:
                return .init(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)
            case .iPadPro11, .iPadPro12_9:
                return .init(top: 24.0, left: 0.0, bottom: 20.0, right: 0.0)
        }
    }
}
