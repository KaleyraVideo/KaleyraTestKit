// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import XCTest
import SwiftHamcrest
import KaleyraTestKit
import KaleyraTestHelpers
import KaleyraTestMatchers

final class UIViewControllerObserverTests: UnitTestCase {

    private let sut = UIViewControllerObserver()

    func testViewDidLoadNotifiesListener() {
        let completionSpy = CompletionSpy<Void>()
        sut.onViewDidLoad = completionSpy.callAsFunction

        let _ = sut.view

        assertThat(completionSpy.invocations, hasCount(1))
    }

    func testViewWillAppearNotifiesListener() {
        let completionSpy = CompletionSpy<Void>()
        sut.onViewWillAppear = completionSpy.callAsFunction

        let _ = sut.view
        sut.viewWillAppear(false)

        assertThat(completionSpy.invocations, hasCount(1))
    }

    func testViewDidAppearNotifiesListener() {
        let completionSpy = CompletionSpy<Void>()
        sut.onViewDidAppear = completionSpy.callAsFunction

        let _ = sut.view
        sut.viewDidAppear(false)

        assertThat(completionSpy.invocations, hasCount(1))
    }

    func testViewDidAppearUpdatesHasViewAppearedFlag() {
        let _ = sut.view

        assertThat(sut.hasViewAppeared, isFalse())
        sut.viewDidAppear(false)

        assertThat(sut.hasViewAppeared, isTrue())
    }

    func testViewWillDisappearNotifiesListener() {
        let completionSpy = CompletionSpy<Void>()
        sut.onViewWillDisappear = completionSpy.callAsFunction

        let _ = sut.view
        sut.viewWillDisappear(false)

        assertThat(completionSpy.invocations, hasCount(1))
    }

    func testViewDidDisappearNotifiesListener() {
        let completionSpy = CompletionSpy<Void>()
        sut.onViewDidDisappear = completionSpy.callAsFunction

        let _ = sut.view
        sut.viewDidDisappear(false)

        assertThat(completionSpy.invocations, hasCount(1))
    }

    func testViewDidDisappearUpdatesHasViewDisappearedFlag() {
        let _ = sut.view

        assertThat(sut.hasViewDisappeared, isFalse())
        sut.viewDidDisappear(false)

        assertThat(sut.hasViewDisappeared, isTrue())
    }

}
