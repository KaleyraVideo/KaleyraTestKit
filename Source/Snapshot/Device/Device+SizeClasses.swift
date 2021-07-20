// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import Foundation

public extension Device {

    func screenSizeClassesFor(orientation: Screen.Orientation, multitaskingMode mode: Screen.MultitaskingMode?) throws -> Screen.SizeClasses {
        guard let mode = mode else { return screenSizeClassesFor(orientation: orientation) }
        guard family == .pad else { throw NotAvailableMultitaskingModeError() }

        if orientation == .portrait {
            switch mode {
                case .oneThird, .twoThird:
                    return .init(horizontal: .compact, vertical: .regular)
                case .half:
                    throw NotAvailableMultitaskingModeError()
            }
        } else {
            switch mode {
                case .oneThird:
                    return .init(horizontal: .compact, vertical: .regular)
                case .half:
                    if model == .iPadPro12_9 {
                        return .init(horizontal: .regular, vertical: .regular)
                    }
                    return .init(horizontal: .compact, vertical: .regular)
                case .twoThird:
                    return .init(horizontal: .regular, vertical: .regular)
            }
        }
    }

    private func screenSizeClassesFor(orientation: Screen.Orientation) -> Screen.SizeClasses {
        guard family == .phone else { return .init(horizontal: .regular, vertical: .regular) }

        if orientation == .portrait {
            return .init(horizontal: .compact, vertical: .regular)
        } else {
            let extendedWidthDevices: [Model] = [.iPhone6Plus, .iPhone6sPlus, .iPhone7Plus, .iPhone8Plus, .iPhoneXr, .iPhoneXsMax, .iPhone11, .iPhone11ProMax, .iPhone12ProMax ]

            if extendedWidthDevices.contains(model) {
                return .init(horizontal: .regular, vertical: .compact)
            }

            return .init(horizontal: .compact, vertical: .compact)
        }
    }
}
