// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import UIKit

public extension UIAlertController {

    @objc(findActionIdentifiedBy:)
    @available(iOS 14.0, *)
    func findAction(identifiedBy accessibilityIdentifier: String) -> UIAlertAction? {
        #if swift(>=5.3)
            return actions.first { $0.accessibilityIdentifier == accessibilityIdentifier }
        #else
            return nil
        #endif
    }

    @objc(findActionByTitle:)
    func findAction(byTitle title: String) -> UIAlertAction? {
        #if swift(>=5.3)
            return actions.first { $0.title == title }
        #else
            return nil
        #endif
    }
}
