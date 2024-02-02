// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import Foundation
import XCTest
import KaleyraTestHelpers

public extension XCTestCase {

    internal struct SkipNotAvailableError: LocalizedError {
        let function: StaticString
        let location: SourceLocation
        let message: String?

        var errorDescription: String? {
            return "Skipping \(function) \(location). \(message ?? "")"
        }
    }

    func skipIf(_ expression: @autoclosure () throws -> Bool, _ message: @autoclosure () -> String?, function: StaticString = #function, file: StaticString = #filePath, line: UInt = #line) throws {
        #if SKIP_TEST_UNAVAILABLE
            if try expression() {
                throw SkipNotAvailableError(function: function, location: SourceLocation(file: file, line: line), message: message())
            }
        #else
            try XCTSkipIf(expression(), message(), file: file, line: line)
        #endif
    }

    func skipUnless(_ expression: @autoclosure () throws -> Bool, _ message: @autoclosure () -> String?, function: StaticString = #function, file: StaticString = #filePath, line: UInt = #line) throws {
        #if SKIP_TEST_UNAVAILABLE
            if try !expression() {
                throw SkipNotAvailableError(function: function, location: SourceLocation(file: file, line: line), message: message())
            }
        #else
            try XCTSkipUnless(expression(), message(), file: file, line: line)
        #endif
    }

    func skip(_ message: @autoclosure () -> String, function: StaticString = #function, file: StaticString = #filePath, line: UInt = #line) throws {
        #if SKIP_TEST_UNAVAILABLE
            throw SkipNotAvailableError(function: function, location: SourceLocation(file: file, line: line), message: message())
        #else
            try XCTSkipIf(true, message(), file: file, line: line)
        #endif
    }
}
