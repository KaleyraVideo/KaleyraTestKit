// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation
import UIKit

public extension UICollectionViewController {

    func cell(at index: Int, section: Int = 0) -> UICollectionViewCell? {
        collectionView.cellForItem(at: IndexPath(item: index, section: section))
    }
}
