// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import Foundation
import XCTest

public extension XCTestCase {

    func wait(timeout: TimeInterval) {
        let exp = expectation(description: "Waiting for \(timeout) seconds")
        XCTWaiter().wait(for: [exp], timeout: timeout)
    }
}
