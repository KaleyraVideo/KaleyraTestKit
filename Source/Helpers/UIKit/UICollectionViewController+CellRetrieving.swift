// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import Foundation
import UIKit

public extension UICollectionViewController {

    func cell(at index: Int, section: Int = 0) -> UICollectionViewCell? {
        collectionView.cellForItem(at: IndexPath(item: index, section: section))
    }
}
