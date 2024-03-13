// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import XCTest

public extension XCTestCase {

    func assertDeallocatedOnTeardown(_ instance: AnyObject, keepingAlive object: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        assertDeallocatedOnTeardown(instance, keepingAlive: [object], file: file, line: line)
    }

#if swift(>=5.10)

    func assertDeallocatedOnTeardown(_ instance: AnyObject, keepingAlive objects: [AnyObject] = [], file: StaticString = #filePath, line: UInt = #line) {
        guard #available(iOS 13.0, *) else { return }

        addTeardownBlock { [weak instance] in
            let _ = objects
            XCTAssertNil(instance, "Instance should have been deallocated after test run, but it has not. This is a potential memory leak", file: file, line: line)
        }
    }

#else

    func assertDeallocatedOnTeardown(_ instance: AnyObject, keepingAlive objects: [AnyObject] = [], file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            let _ = objects
            XCTAssertNil(instance, "Instance should have been deallocated after test run, but it has not. This is a potential memory leak", file: file, line: line)
        }
    }

#endif
}
