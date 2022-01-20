// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import XCTest
import Hamcrest
import BandyerTestKit

class UIView_SimulatedGesturesTests: UnitTestCase {

    private let view = UIView()
    private let spy = GestureRecognizerActionInvocationSpy()
    
    func testInvokesTapGestureRecognizerAction() throws {
        let tapRecognizer = UITapGestureRecognizer(target: spy, action: #selector(GestureRecognizerActionInvocationSpy.action(_:)))
        view.addGestureRecognizer(tapRecognizer)
        
        try view.simulateTapRecognition()
        
        assertThat(spy.actionInvocations, equalTo(1))
    }
    
    func testFailsWhenTapGestureRecognizerIsNotFound() {
        let tapRecognizer = UITapGestureRecognizer(target: spy, action: #selector(GestureRecognizerActionInvocationSpy.action(_:)))
        view.addGestureRecognizer(tapRecognizer)
        view.removeGestureRecognizer(tapRecognizer)
        
        assertThrows(try view.simulateTapRecognition())
    }
    
    func testInvokesSwipeGestureRecognizerAction() throws {
        let swipeRecognizer = UISwipeGestureRecognizer(target: spy, action: #selector(GestureRecognizerActionInvocationSpy.action(_:)))
        view.addGestureRecognizer(swipeRecognizer)
        
        try view.simulateSwipeRecognition()
        
        assertThat(spy.actionInvocations, equalTo(1))
    }
    
    func testFailsWhenSwipeGestureRecognizerIsNotFound() {
        let swipeRecognizer = UISwipeGestureRecognizer(target: spy, action: #selector(GestureRecognizerActionInvocationSpy.action(_:)))
        view.addGestureRecognizer(swipeRecognizer)
        view.removeGestureRecognizer(swipeRecognizer)
        
        assertThrows(try view.simulateSwipeRecognition())
    }

    func testInvokesLongGestureRecognizerAction() throws {
        let longRecognizer = UILongPressGestureRecognizer(target: spy, action: #selector(GestureRecognizerActionInvocationSpy.action(_:)))
        view.addGestureRecognizer(longRecognizer)

        try view.simulateLongPressRecognition()

        assertThat(spy.actionInvocations, equalTo(1))
    }

    func testFailsWhenLongPressGestureRecognizerIsNotFound() {
        let longRecognizer = UILongPressGestureRecognizer(target: spy, action: #selector(GestureRecognizerActionInvocationSpy.action(_:)))
        view.addGestureRecognizer(longRecognizer)
        view.removeGestureRecognizer(longRecognizer)

        assertThrows(try view.simulateLongPressRecognition())
    }
}

private class GestureRecognizerActionInvocationSpy: NSObject {
    
    var actionInvocations: Int = 0
    
    @objc func action(_ sender: UIGestureRecognizer) {
        actionInvocations += 1
    }
}
