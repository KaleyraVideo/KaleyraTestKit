// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation
import UIKit

public extension UITraitCollection {

    static func makeTraits(horizontalSizeClass: UIUserInterfaceSizeClass, verticalSizeClass: UIUserInterfaceSizeClass) -> UITraitCollection {
        let horizontalTrait = UITraitCollection(horizontalSizeClass: horizontalSizeClass)
        let verticalTrait = UITraitCollection(verticalSizeClass: verticalSizeClass)
        return UITraitCollection(traitsFrom: [horizontalTrait, verticalTrait])
    }
}
