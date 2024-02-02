// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE for licensing information

import Foundation
import CoreGraphics

public extension Device {

    func screenSizeFor(orientation: Screen.Orientation) -> CGSize {
        orientation == .portrait ? screenSize : screenSize.rotated
    }

    func screenSizeFor(orientation: Screen.Orientation, multitaskingMode: Screen.MultitaskingMode?) throws -> CGSize {
        if orientation == .portrait && multitaskingMode == .half {
            throw UnsupportedSnapshotConfigurationError()
        }

        let size = screenSizeFor(orientation: orientation)

        switch multitaskingMode {
            case .none:
                return size
            case .oneThird:
                return size.oneThird
            case .half:
                return size.half
            case .twoThird:
                return size.twoThird
        }
    }
}
