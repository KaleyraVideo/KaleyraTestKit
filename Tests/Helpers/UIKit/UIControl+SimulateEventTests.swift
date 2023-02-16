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

class UIControl_SimulateEventTests: UnitTestCase {

    func testSimulateEventCallsAllTargetsActionsBoundToTheEventInvokingTheSelectorsTakingNoArguments() {
        let button = UIButton(type: .system)
        let target1 = ActionTarget()
        let target2 = ActionTarget()
        button.addTarget(target1, action: #selector(ActionTarget.action), for: .touchUpInside)
        button.addTarget(target2, action: #selector(ActionTarget.action), for: .touchUpInside)

        button.simulate(event: .touchUpInside)

        assertThat(target1.hasReceivedEvent, isTrue())
        assertThat(target2.hasReceivedEvent, isTrue())
    }

    func testSimulateEventCallsAllTargetsActionsBoundToTheEventInvokingTheSelectorsTakingTheSenderAsArgument() {
        let button = UIButton(type: .system)
        let target1 = ActionTargetWithSender()
        let target2 = ActionTargetWithSender()
        button.addTarget(target1, action: #selector(ActionTargetWithSender.action(sender:)), for: .touchUpInside)
        button.addTarget(target2, action: #selector(ActionTargetWithSender.action(sender:)), for: .touchUpInside)

        button.simulate(event: .touchUpInside)

        assertThat(target1.hasReceivedEvent, isTrue())
        assertThat(target1.sender, equalTo(button))
        assertThat(target2.hasReceivedEvent, isTrue())
        assertThat(target2.sender, equalTo(button))
    }

    func testSimulateEventCallsAllTargetsActionsBoundToTheEventInvokingTheSelectorTakingTheSenderAndTheEventAsArguments() {
        let button = UIButton(type: .system)
        let target1 = ActionTargetWithSenderForEvent()
        let target2 = ActionTargetWithSenderForEvent()
        button.addTarget(target1, action: #selector(ActionTargetWithSenderForEvent.action(sender:forEvent:)), for: .touchUpInside)
        button.addTarget(target2, action: #selector(ActionTargetWithSenderForEvent.action(sender:forEvent:)), for: .touchUpInside)

        button.simulate(event: .touchUpInside)

        assertThat(target1.hasReceivedEvent, isTrue())
        assertThat(target1.sender, equalTo(button))
        assertThat(target1.event, present())
        assertThat(target2.hasReceivedEvent, isTrue())
        assertThat(target2.sender, equalTo(button))
        assertThat(target2.event, present())
    }

    func testSimulateEventCallsAllTargetActionsBoundToTheEventEvenIfTheActionSelectorHasNotACanonicalFormat()
    {
        let button = UIButton(type: .system)
        let target1 = ActionTargetWithSender()
        let target2 = ActionTargetWithSenderForEvent()
        button.addTarget(target1, action: #selector(ActionTargetWithSender.action(sender:)), for: .touchUpInside)
        button.addTarget(target2, action: #selector(ActionTargetWithSenderForEvent.action(sender:forEvent:)), for: .touchUpInside)

        button.simulate(event: .touchUpInside)

        assertThat(target1.hasReceivedEvent, isTrue())
        assertThat(target1.sender, equalTo(button))
        assertThat(target2.hasReceivedEvent, isTrue())
        assertThat(target2.sender, equalTo(button))
        assertThat(target2.event, present())
    }

    // MARK: Helpers

    private class ActionTarget: NSObject {

        private(set) var hasReceivedEvent: Bool = false

        @objc
        func action() {
            hasReceivedEvent = true
        }
    }

    private class ActionTargetWithSender: NSObject {

        var hasReceivedEvent: Bool {
            sender != nil
        }
        private(set) var sender: UIControl?

        @objc
        func action(sender: UIControl) {
            self.sender = sender
        }

        @objc
        func malformedAction(_ sender: UIControl) {
            self.sender = sender
        }
    }

    private class ActionTargetWithSenderForEvent: NSObject {

        var hasReceivedEvent: Bool {
            sender != nil
        }
        private(set) var sender: UIControl?
        private(set) var event: UIEvent?

        @objc
        func action(sender: UIControl, forEvent event: UIEvent) {
            self.sender = sender
            self.event = event
        }

        @objc
        func malformedAction(_ sender: UIControl, for event: UIEvent) {
            self.sender = sender
            self.event = event
        }
    }

}
