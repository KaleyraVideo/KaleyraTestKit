// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE for licensing information

import Foundation
import CoreGraphics

extension CGSize {

    var rotated: CGSize {
        .init(width: height, height: width)
    }

    var oneThird: CGSize {
        .init(width: width / 3, height: height)
    }

    var half: CGSize {
        .init(width: width / 2, height: height)
    }

    var twoThird: CGSize {
        .init(width: width * 2 / 3, height: height)
    }
}
