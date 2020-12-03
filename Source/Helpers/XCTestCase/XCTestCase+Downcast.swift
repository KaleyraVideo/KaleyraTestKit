// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation
import XCTest

public extension XCTestCase {

    func cast<T, U>(_ value: T, file: StaticString = #filePath, line: UInt = #line) throws -> U {
        try TestHelpers.cast(value, file: file, line: line)
    }
}
