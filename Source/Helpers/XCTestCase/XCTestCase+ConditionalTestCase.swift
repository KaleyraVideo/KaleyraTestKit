// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import XCTest

@available(iOS 2.0, *)
public protocol ConditionalTestCase: XCTestCase {

    func run(ifVersionAtLeast major: UInt, _ message: @autoclosure () -> String, function: StaticString, file: StaticString, line: UInt, runnable: () throws -> Void) throws

    func run(ifVersionAtLeast version: OperatingSystemVersion, _ message: @autoclosure () -> String, function: StaticString, file: StaticString, line: UInt, runnable: () throws -> Void) throws

    func run(ifVersionBelow major: UInt, _ message: @autoclosure () -> String, function: StaticString, file: StaticString, line: UInt, runnable: () throws -> Void) throws

    func run(ifVersionBelow version: OperatingSystemVersion, _ message: @autoclosure () -> String, function: StaticString, file: StaticString, line: UInt, runnable: () throws -> Void) throws
}

@available(iOS 2.0, *)
public extension ConditionalTestCase {

    func run(ifVersionAtLeast major: UInt, _ message: @autoclosure () -> String, function: StaticString = #function, file: StaticString = #filePath, line: UInt = #line, runnable: () throws -> Void) throws {
        try run(ifVersionAtLeast: OperatingSystemVersion(major, 0, 0), message(), function: function, file: file, line: line, runnable: runnable)
    }

    func run(ifVersionAtLeast version: OperatingSystemVersion, _ message: @autoclosure () -> String, function: StaticString = #function, file: StaticString = #filePath, line: UInt = #line, runnable: () throws -> Void) throws {
        assert(version.majorVersion > 0 && version.majorVersion <= 25, "Major version must be greater than zero and less than or equal to 25")
        assert(version.minorVersion >= 0 && version.minorVersion <= 25, "Minor version must be greater than zero and less than or equal to 25")
        assert(version.patchVersion >= 0, "Patch version must be greater or equal to zero")

        do {
            try skipUnless(ProcessInfo.processInfo.isOperatingSystemAtLeast(version), message(), function: function, file: file, line: line)
            try runnable()
        } catch let error as XCTestCase.SkipNotAvailableError {
            print(error.errorDescription ?? "")
            return
        }
    }

    func run(ifVersionBelow major: UInt, _ message: @autoclosure () -> String, function: StaticString = #function, file: StaticString = #filePath, line: UInt = #line, runnable: () throws -> Void) throws {
        try run(ifVersionBelow: OperatingSystemVersion(major, 0, 0), message(), function: function, file: file, line: line, runnable: runnable)
    }

    func run(ifVersionBelow version: OperatingSystemVersion, _ message: @autoclosure () -> String, function: StaticString = #function, file: StaticString = #filePath, line: UInt = #line, runnable: () throws -> Void) throws {
        assert(version.majorVersion > 0 && version.majorVersion <= 25, "Major version must be greater than zero and less than or equal to 25")
        assert(version.minorVersion >= 0 && version.minorVersion <= 25, "Minor version must be greater than zero and less than or equal to 25")
        assert(version.patchVersion >= 0, "Patch version must be greater or equal to zero")
        
        do {
            try skipIf(ProcessInfo.processInfo.isOperatingSystemAtLeast(version), message(), function: function, file: file, line: line)
            try runnable()
        } catch let error as XCTestCase.SkipNotAvailableError {
            print(error.errorDescription ?? "")
            return
        }
    }
}
