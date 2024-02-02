// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import Foundation
import SwiftHamcrest

public func isTrue() -> Matcher<Bool> {
    return Matcher("true") { (value: Bool) in
        value == true
    }
}

public func isFalse() -> Matcher<Bool> {
    return Matcher("false") { (value: Bool) in
        value != true
    }
}

public func hasCount<T: Collection>(_ expectedCount: UInt) -> Matcher<T> {
    return hasCount(Int(expectedCount))
}
