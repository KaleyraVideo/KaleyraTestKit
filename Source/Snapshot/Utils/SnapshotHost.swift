// Copyright © 2021 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation
import UIKit

class SnapshotHost: UIWindow {

    private let configuration: SnapshotConfiguration

    override var traitCollection: UITraitCollection {
        UITraitCollection(traitsFrom: [super.traitCollection, configuration.traitCollection])
    }

    @available(iOS 11.0, *)
    override var safeAreaInsets: UIEdgeInsets {
        get {
            configuration.safeAreaInsets
        }
    }

    init(configuration: SnapshotConfiguration) {
        self.configuration = configuration
        super.init(frame: CGRect(x: 0, y: 0, width: configuration.size.width, height: configuration.size.height))
        self.layoutMargins = configuration.layoutMargins
    }

    required init?(coder: NSCoder) {
        fatalError("Not supported")
    }
}
