// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import XCTest
import UIKit
import SwiftHamcrest
import KaleyraTestKit
import KaleyraTestHelpers

final class UIButton_SimulateTapTests: UnitTestCase {

    func testSimulateTapCallsTouchDownAndTouchUpInsideActions() {
        let button = UIButton(type: .system)
        let target = ButtonActionTarget()
        button.addTarget(target, action: #selector(ButtonActionTarget.touchDownAction(sender:)), for: .touchDown)
        button.addTarget(target, action: #selector(ButtonActionTarget.touchUpInsideAction(sender:)), for: .touchUpInside)

        button.simulateTap()

        assertThat(target.touchDownInvocations.first, presentAnd(equalTo(button)))
        assertThat(target.touchUpInsideInvocations.first, presentAnd(equalTo(button)))
    }

    // MARK: Helpers

    private class ButtonActionTarget: NSObject {

        private(set) var touchDownInvocations = [UIControl]()
        private(set) var touchUpInsideInvocations = [UIControl]()

        @objc
        func touchUpInsideAction(sender: UIButton) {
            touchUpInsideInvocations.append(sender)
        }

        @objc
        func touchDownAction(sender: UIButton) {
            touchDownInvocations.append(sender)
        }
    }
}
