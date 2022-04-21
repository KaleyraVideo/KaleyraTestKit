// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
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
