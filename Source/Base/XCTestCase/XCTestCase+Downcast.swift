// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import Foundation
import XCTest
import KaleyraTestHelpers

public extension XCTestCase {

    func cast<T, U>(_ value: T, file: StaticString = #filePath, line: UInt = #line) throws -> U {
        try TestHelpers.cast(value, file: file, line: line)
    }
}
