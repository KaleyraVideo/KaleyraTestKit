// Copyright © 2018-2024 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import Foundation
import XCTest

public extension XCTestCase {

    func assertOnTeardown(_ assertion: @escaping () throws -> Void) rethrows {
        addTeardownBlock(assertion)
    }
}
