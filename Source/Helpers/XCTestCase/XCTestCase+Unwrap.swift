// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation
import XCTest

public extension XCTestCase {

    func unwrap<T>(_ expression: @autoclosure () throws -> T?, _ message: @autoclosure () -> String = "", file: StaticString = #filePath, line: UInt = #line) throws -> T {
        try XCTUnwrap(expression(), message(), file: file, line: line)
    }
}
