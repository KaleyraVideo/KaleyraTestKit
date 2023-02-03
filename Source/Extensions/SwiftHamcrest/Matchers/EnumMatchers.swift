// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
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

public func matchCaseWithAssociatedValue<T: Equatable>(_ expected: T) -> Matcher<T> {

    func caseName<T>(_ value: T) -> String {
        return Mirror(reflecting: value).children.first?.label ?? String(describing: value)
    }

    return Matcher("\(expected) case") { (actual: T) -> MatchResult in
        guard Mirror(reflecting: actual).displayStyle == .enum else { return .mismatch("Actual value should be an enum, got \(actual)") }
        guard Mirror(reflecting: expected).displayStyle == .enum else { return .mismatch("Expected value should be an enum, got \(expected)") }

        let actualCase = caseName(actual)
        let expectedCase = caseName(expected)
        let isMatching = actual == expected && actualCase == expectedCase
        return isMatching ? .match : .mismatch("\(actualCase) does not match \(expectedCase)")
    }
}

