// Copyright © 2018-2024 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import Foundation
import XCTest

public extension XCTestCase {

#if swift(>=5.10)

    func assertOnTeardown(_ assertion: @escaping () throws -> Void) rethrows {
        guard #available(iOS 13.0, *) else { return }

        addTeardownBlock(assertion)
    }

#else

    func assertOnTeardown(_ assertion: @escaping () throws -> Void) rethrows {
        addTeardownBlock(assertion)
    }

#endif
}
