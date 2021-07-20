// Copyright © 2021 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation
import UIKit

public extension Screen.Scale {

    init?(_ screen: UIScreen) {
        switch screen.scale {
            case 1:
                self = .x1
            case 2:
                self = .x2
            case 3:
                self = .x3
            default:
                return nil
        }
    }
}
