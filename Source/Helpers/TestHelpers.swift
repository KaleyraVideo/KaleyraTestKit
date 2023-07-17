// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import Foundation

public enum TestHelpers {}

public extension TestHelpers {

    private struct CastError<T, U>: LocalizedError {
        let location: SourceLocation

        var errorDescription: String? {
            return "Could not cast value of type \(T.self) to type \(U.self) \(location)"
        }
    }

    static func cast<T, U>(_ value: T, file: StaticString = #filePath, line: UInt = #line) throws -> U {
        guard let casted = value as? U else {
            throw CastError<T, U>(location: SourceLocation(file: file, line: line))
        }
        return casted
    }
}

public extension TestHelpers {

    private struct UnwrapError<T>: LocalizedError {
        let value: T?
        let location: SourceLocation

        var errorDescription: String? {
            return "Could not unwrap value \(String(describing: value)) \(location)"
        }
    }

    static func unwrap<T>(_ value: T?, file: StaticString = #filePath, line: UInt = #line) throws -> T {
        guard let unwrapped = value else {
            throw UnwrapError(value: value, location: SourceLocation(file: file, line: line))
        }
        return unwrapped
    }
}

