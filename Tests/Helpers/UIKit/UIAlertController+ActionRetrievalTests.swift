// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import XCTest
import UIKit
#if canImport(Hamcrest)
import Hamcrest
#elseif canImport(SwiftHamcrest)
import SwiftHamcrest
#endif
import BandyerTestKit

class UIAlertController_ActionRetrievalTests: UnitTestCase, ConditionalTestCase {

    #if swift(>=5.3)

    @available(iOS 14.0, *)
    func testFindActionIdentifiedByReturnsTheActionIdentifiedByTheAccessibilityIdentifierProvided() throws {
        try run(ifVersionAtLeast: 14, "findAction(identifiedBy:) is available from iOS 14", runnable: {
            let alert = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            cancelAction.accessibilityIdentifier = "cancel"
            let doAction = UIAlertAction(title: "do", style: .default, handler: nil)
            doAction.accessibilityIdentifier = "do"
            alert.addAction(doAction)
            alert.addAction(cancelAction)

            let action = alert.findAction(identifiedBy: "cancel")

            assertThat(action, presentAnd(equalTo(cancelAction)))
        })
    }

    #else

    func testFindActionIdentifiedByReturnsTheActionIdentifiedByTheAccessibilityIdentifierProvided() throws {
        try skip("UIAlertAction gained accessibilityIdenfier in iOS 14. Unfortunately, swift cannot check iOS sdk at compile time. Skipping this test on older swift compilers")
    }

    #endif

    func testFindFirstActionByTitleReturnsTheFirstActionWithTheTitleProvided() {
        let alert = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "title", style: .cancel, handler: nil)
        let doAction = UIAlertAction(title: "title", style: .default, handler: nil)
        alert.addAction(doAction)
        alert.addAction(cancelAction)

        let action = alert.findAction(byTitle: "title")

        assertThat(action, presentAnd(equalTo(doAction)))
    }
}
