// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import XCTest
import UIKit

open class AnimationsDisabledTestCase: UnitTestCase {

    open override func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)
    }

    open override func tearDown() {
        CATransaction.flush()
        super.tearDown()
        UIView.setAnimationsEnabled(true)
    }
}
