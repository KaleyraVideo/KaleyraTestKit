// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import XCTest
#if canImport(Hamcrest)
import Hamcrest
#elseif canImport(SwiftHamcrest)
import SwiftHamcrest
#endif
import KaleyraTestKit

class UIViewControllerObserverTests: XCTestCase {

    private let sut = UIViewControllerObserver()

    func testViewDidLoadNotifiesListener() {
        let completionSpy = CompletionSpy<Void>()
        sut.onViewDidLoad = completionSpy.callable

        let _ = sut.view

        assertThat(completionSpy.invocations, hasCount(1))
    }

    func testViewWillAppearNotifiesListener() {
        let completionSpy = CompletionSpy<Void>()
        sut.onViewWillAppear = completionSpy.callable

        let _ = sut.view
        sut.viewWillAppear(false)

        assertThat(completionSpy.invocations, hasCount(1))
    }

    func testViewDidAppearNotifiesListener() {
        let completionSpy = CompletionSpy<Void>()
        sut.onViewDidAppear = completionSpy.callable

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
        sut.onViewWillDisappear = completionSpy.callable

        let _ = sut.view
        sut.viewWillDisappear(false)

        assertThat(completionSpy.invocations, hasCount(1))
    }

    func testViewDidDisappearNotifiesListener() {
        let completionSpy = CompletionSpy<Void>()
        sut.onViewDidDisappear = completionSpy.callable

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
