// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import Foundation
import CoreGraphics

public struct SnapshotTolerance {

    public static let zero = SnapshotTolerance(overall: .zero, perPixel: .zero)

    public let overall: CGFloat
    public let perPixel: CGFloat

    public init(overall: CGFloat, perPixel: CGFloat) {
        self.overall = overall
        self.perPixel = perPixel
    }
}
