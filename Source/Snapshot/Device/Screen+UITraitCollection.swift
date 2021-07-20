// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import Foundation
import UIKit

@available(iOS 13.0, *)
public extension Screen.Style {

    var traitCollection: UITraitCollection {
        switch self {
            case .light:
                return UITraitCollection(userInterfaceStyle: .light)
            case .dark:
                return UITraitCollection(userInterfaceStyle: .dark)
        }
    }
}

public extension Screen.LayoutDirection {
    
    var traitCollection: UITraitCollection {
        switch self {
            case .leftToRight:
                return UITraitCollection(layoutDirection: .leftToRight)
            case .rightToLeft:
                return UITraitCollection(layoutDirection: .rightToLeft)
        }
    }
}

public extension Screen.ContentSize {
    
    var traitCollection: UITraitCollection {
        switch self {
            case .extraSmall:
                return UITraitCollection(preferredContentSizeCategory: .extraSmall)
            case .small:
                return UITraitCollection(preferredContentSizeCategory: .small)
            case .medium:
                return UITraitCollection(preferredContentSizeCategory: .medium)
            case .large:
                return UITraitCollection(preferredContentSizeCategory: .large)
            case .extraLarge:
                return UITraitCollection(preferredContentSizeCategory: .extraLarge)
            case .extraExtraLarge:
                return UITraitCollection(preferredContentSizeCategory: .extraExtraLarge)
            case .extraExtraExtraLarge:
                return UITraitCollection(preferredContentSizeCategory: .extraExtraExtraLarge)
        }
    }
}

public extension Screen.SizeClasses {

    var traitCollection: UITraitCollection {
        return UITraitCollection(traitsFrom: [UITraitCollection(horizontalSizeClass: horizontal.userInterfaceSizeClass), UITraitCollection(verticalSizeClass: vertical.userInterfaceSizeClass)])
    }
}

public extension Screen.SizeClasses.SizeClass {

    var userInterfaceSizeClass: UIUserInterfaceSizeClass {
        switch self {
            case .regular:
                return .regular
            case .compact:
                return .compact
        }
    }
}
