// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import Foundation
import UIKit

public struct SnapshotConfiguration {

    public let size: CGSize
    public let safeAreaInsets: UIEdgeInsets
    public let layoutMargins: UIEdgeInsets
    public let traitCollection: UITraitCollection

    public init(size: CGSize, safeAreaInsets: UIEdgeInsets, layoutMargins: UIEdgeInsets, traitCollection: UITraitCollection) {
        self.size = size
        self.safeAreaInsets = safeAreaInsets
        self.layoutMargins = layoutMargins
        self.traitCollection = traitCollection
    }
}
