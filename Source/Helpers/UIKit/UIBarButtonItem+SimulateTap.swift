// Copyright © 2018-2025 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import UIKit

public extension UIBarButtonItem {

    private enum TapError: Error {

        case buttonTargetNotFound
        case buttonActionNotFound
    }

    func simulateTap() throws {
        guard let target = target else { throw TapError.buttonTargetNotFound }
        guard let action = action else { throw TapError.buttonActionNotFound }

        let _ = target.perform(action, with: self)
    }
}
