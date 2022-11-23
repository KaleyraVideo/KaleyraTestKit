// Copyright © 2022 Kaleyra S.p.a. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation

public extension Array where Element == Void {

    mutating func append() {
        append(())
    }
}
