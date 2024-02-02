// Copyright © 2024 Kaleyra S.p.a. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation

open class MinOSVersionRequiredTestCase: UnitTestCase, ConditionalTestCase {

    fileprivate class var iOSVersion: UInt { 9 }

    open override func setUpWithError() throws {
        try super.setUpWithError()
        try run(ifVersionAtLeast: Self.iOSVersion, "iOS \(Self.iOSVersion) required to run the test. Skipped", runnable: {})
    }
}

@available(iOS 10.0, *)
open class iOS10AndAboveTestCase: MinOSVersionRequiredTestCase {

    override class var iOSVersion: UInt { 10 }
}

@available(iOS 11.0, *)
open class iOS11AndAboveTestCase: MinOSVersionRequiredTestCase {

    override class var iOSVersion: UInt { 11 }
}

@available(iOS 12.0, *)
open class iOS12AndAboveTestCase: MinOSVersionRequiredTestCase {

    override class var iOSVersion: UInt { 12 }
}

@available(iOS 13.0, *)
open class iOS13AndAboveTestCase: MinOSVersionRequiredTestCase {

    override class var iOSVersion: UInt { 13 }
}

@available(iOS 15.0, *)
open class iOS15AndAboveTestCase: MinOSVersionRequiredTestCase {

    override class var iOSVersion: UInt { 15 }
}

open class MaxOSVersionRequiredTestCase: UnitTestCase, ConditionalTestCase {

    fileprivate class var iOSVersion: UInt { 99 }

    open override func setUpWithError() throws {
        try super.setUpWithError()
        try run(ifVersionBelow: Self.iOSVersion, "iOS version must below \(Self.iOSVersion) to run the test. Skipped", runnable: {})
    }
}
