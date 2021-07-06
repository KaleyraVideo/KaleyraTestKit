// Copyright © 2021 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation
import Hamcrest

public func matchCase<T>(_ expected: T) -> Matcher<T> {

    func caseName<T>(_ value: T) -> String {
        return Mirror(reflecting: value).children.first?.label ?? String(describing: value)
    }

    return Matcher("\(expected) case") { (actual: T) -> MatchResult in
        guard Mirror(reflecting: actual).displayStyle == .enum else { return .mismatch("Actual value should be an enum, got \(actual)") }
        guard Mirror(reflecting: expected).displayStyle == .enum else { return .mismatch("Expected value should be an enum, got \(expected)") }

        let actualCase = caseName(actual)
        let expectedCase = caseName(expected)
        return actualCase == expectedCase ? .match : .mismatch("\(actualCase) does not match \(expectedCase)")
    }
}

