// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE for licensing information

import Foundation

@available(iOS 13.0, *)
public extension UIColor {

    var resolvedDarkColor: UIColor {
        resolvedColor(basedOnInterface: .dark)
    }

    var resolvedLightColor: UIColor {
        resolvedColor(basedOnInterface: .light)
    }

    private func resolvedColor(basedOnInterface style: UIUserInterfaceStyle) -> UIColor {
        resolvedColor(with: UITraitCollection(userInterfaceStyle: style))
    }
}
