// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import Foundation

public struct SourceLocation: CustomStringConvertible {

    public let file: StaticString
    public let line: UInt

    public init(file: StaticString = #filePath, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    public var description: String {
        "file: \(file) at line: \(line)"
    }
}
