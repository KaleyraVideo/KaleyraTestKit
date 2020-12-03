// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation
import UIKit

public extension UICollectionView {

    enum CellSelectionError: Error {
        case delegateNotFound
        case delegateDoesNotImplement(method: String)
    }

    func simulateCellSelection(at indexPath: IndexPath) throws {
        guard let delegate = self.delegate else {
            throw CellSelectionError.delegateNotFound
        }

        guard (delegate.collectionView(_:didSelectItemAt:)) != nil else {
            throw CellSelectionError.delegateDoesNotImplement(method: "collectionView(_:didSelectItemAt:)")
        }
        
        delegate.collectionView?(self, didSelectItemAt: indexPath)
    }
}
