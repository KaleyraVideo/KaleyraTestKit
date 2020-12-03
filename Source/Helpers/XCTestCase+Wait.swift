// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation
import XCTest

public extension XCTestCase {

    func wait(timeout: TimeInterval) {
        let exp = expectation(description: "Waiting for \(timeout) seconds")
        XCTWaiter().wait(for: [exp], timeout: timeout)
    }
}
