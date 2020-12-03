// Copyright © 2019 Bandyer. All rights reserved.
// See LICENSE.txt for licensing information

#if canImport(Hamcrest)

import Foundation
import Hamcrest

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

#endif
