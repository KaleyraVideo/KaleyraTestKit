// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import UIKit

public extension UIButton {

    @objc
    func simulateTap() {
        simulate(event: .touchDown)
        simulate(event: .touchUpInside)
    }
}
