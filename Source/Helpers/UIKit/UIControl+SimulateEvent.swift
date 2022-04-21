// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import Foundation
import UIKit

public extension UIControl {

    @objc(simulateEvent:)
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                let colons = $0.lowercased().filter({ $0 == ":" })
                if colons.count >= 2 {
                    (target as NSObject).perform(Selector($0), with: self, with: UIEvent())
                } else if colons.count == 1 {
                    (target as NSObject).perform(Selector($0), with: self)
                } else {
                    (target as NSObject).perform(Selector($0))
                }
            }
        }
    }
}
