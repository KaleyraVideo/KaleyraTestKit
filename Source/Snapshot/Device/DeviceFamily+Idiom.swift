// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import Foundation
import UIKit

public extension Device.Family {

    init?(userInterfaceIdiom: UIUserInterfaceIdiom) {
        switch userInterfaceIdiom {
            case .phone:
                self = .phone
            case .pad:
                self = .pad
            case .tv, .carPlay, .mac, .unspecified:
                return nil
            default:
                return nil
        }
    }
}
