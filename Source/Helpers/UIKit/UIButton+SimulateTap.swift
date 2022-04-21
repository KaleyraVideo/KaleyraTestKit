// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import UIKit

public extension UIButton {

    @objc
    func simulateTap() {
        simulate(event: .touchDown)
        simulate(event: .touchUpInside)
    }
}
