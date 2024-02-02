// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE for licensing information

import Foundation

public enum Screen {

    public enum Scale: Equatable {
        case x1
        case x2
        case x3
    }

    public enum Orientation: CaseIterable, Equatable {
        case portrait
        case landscape
    }

    public enum Style: CaseIterable, Equatable {
        case light
        case dark
    }

    public enum LayoutDirection: CaseIterable, Equatable {
        case leftToRight
        case rightToLeft
    }

    public enum ContentSize: CaseIterable, Equatable {
        case extraSmall
        case small
        case medium
        case large
        case extraLarge
        case extraExtraLarge
        case extraExtraExtraLarge
    }

    public struct SizeClasses: Equatable {

        public enum SizeClass: Equatable {
            case regular
            case compact
        }

        public let horizontal: SizeClass
        public let vertical: SizeClass

        public init(horizontal: Screen.SizeClasses.SizeClass, vertical: Screen.SizeClasses.SizeClass) {
            self.horizontal = horizontal
            self.vertical = vertical
        }
    }

    public enum MultitaskingMode: CaseIterable, Equatable {
        case oneThird
        case half
        case twoThird
    }
}
