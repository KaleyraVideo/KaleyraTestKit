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
            try XCTSkipIf(expression(), message(), file: file, line: line)
    }

    func skipUnless(_ expression: @autoclosure () throws -> Bool, _ message: @autoclosure () -> String?, function: StaticString = #function, file: StaticString = #filePath, line: UInt = #line) throws {
            try XCTSkipUnless(expression(), message(), file: file, line: line)
    }

    func skip(_ message: @autoclosure () -> String, function: StaticString = #function, file: StaticString = #filePath, line: UInt = #line) throws {
        try XCTSkipIf(true, message(), file: file, line: line)
    }
}
