// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import XCTest
import UIKit

@objc(BTKAnimationsDisabledTestCase)
open class AnimationsDisabledTestCase: BTKUnitTestCase {
    
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
