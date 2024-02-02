// Copyright © 2024 Kaleyra S.p.a. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation
import XCTest

open class UnitTestCase: XCTestCase {

    open override func setUp() {
        super.setUp()

        continueAfterFailure = false
    }
}
