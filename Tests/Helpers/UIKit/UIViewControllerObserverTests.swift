// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import XCTest
import Hamcrest
import BandyerTestKit

class UIViewControllerObserverTests: XCTestCase {

    private let sut = UIViewControllerObserver()

    func testViewDidLoadNotifiesListener() {
        let completionSpy = CompletionSpy<Void>()
        sut.onViewDidLoad = completionSpy.callable

        let _ = sut.view

        assertThat(completionSpy.called, isTrue())
    }

    func testViewWillAppearNotifiesListener() {
        let completionSpy = CompletionSpy<Void>()
        sut.onViewWillAppear = completionSpy.callable

        let _ = sut.view
        sut.viewWillAppear(false)

        assertThat(completionSpy.called, isTrue())
    }

    func testViewDidAppearNotifiesListener() {
        let completionSpy = CompletionSpy<Void>()
        sut.onViewDidAppear = completionSpy.callable

        let _ = sut.view
        sut.viewDidAppear(false)

        assertThat(completionSpy.called, isTrue())
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

        assertThat(completionSpy.called, isTrue())
    }

    func testViewDidDisappearNotifiesListener() {
        let completionSpy = CompletionSpy<Void>()
        sut.onViewDidDisappear = completionSpy.callable

        let _ = sut.view
        sut.viewDidDisappear(false)

        assertThat(completionSpy.called, isTrue())
    }

    func testViewDidDisappearUpdatesHasViewDisappearedFlag() {
        let _ = sut.view

        assertThat(sut.hasViewDisappeared, isFalse())
        sut.viewDidDisappear(false)

        assertThat(sut.hasViewDisappeared, isTrue())
    }

}
