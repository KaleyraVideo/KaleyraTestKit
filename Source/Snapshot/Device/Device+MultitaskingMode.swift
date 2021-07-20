// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import Foundation

public extension Device {

    var multitaskingModes: [Screen.MultitaskingMode] {
        guard family == .pad else { return [] }

        return Screen.MultitaskingMode.allCases
    }

    func multitaskingModes(for orientation: Screen.Orientation) -> [Screen.MultitaskingMode] {
        let modes = multitaskingModes

        if orientation == .portrait {
            return modes.filter({ $0 != .half})
        }
        return modes
    }
}
