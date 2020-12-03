// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import XCTest
import Hamcrest
import BandyerTestKit

class UIView_SimulatedGesturesTests: BTKUnitTestCase {

    private let view = UIView()
    private let spy = GestureRecognizerActionInvocationSpy()
    
    func testInvokesTapGestureRecognizerAction() {
        let tapRecognizer = UITapGestureRecognizer(target: spy, action: #selector(GestureRecognizerActionInvocationSpy.action(_:)))
        view.addGestureRecognizer(tapRecognizer)
        
        view.simulateTapRecognition()
        
        assertThat(spy.actionInvocations, equalTo(1))
    }
    
    func testFailsWhenTapGestureRecognizerIsNotFound() {
        let tapRecognizer = UITapGestureRecognizer(target: spy, action: #selector(GestureRecognizerActionInvocationSpy.action(_:)))
        view.addGestureRecognizer(tapRecognizer)
        
        view.removeGestureRecognizer(tapRecognizer)
        
        view.simulateTapRecognition(XCTAssertTrue(true))
    }
    
    func testInvokesSwipeGestureRecognizerAction() {
        let swipeRecognizer = UISwipeGestureRecognizer(target: spy, action: #selector(GestureRecognizerActionInvocationSpy.action(_:)))
        view.addGestureRecognizer(swipeRecognizer)
        
        view.simulateSwipeRecognition()
        
        assertThat(spy.actionInvocations, equalTo(1))
    }
    
    func testFailsWhenSwipeGestureRecognizerIsNotFound() {
        let swipeRecognizer = UISwipeGestureRecognizer(target: spy, action: #selector(GestureRecognizerActionInvocationSpy.action(_:)))
        view.addGestureRecognizer(swipeRecognizer)
        
        view.removeGestureRecognizer(swipeRecognizer)
        
        view.simulateSwipeRecognition(XCTAssertTrue(true))
    }
}

private class GestureRecognizerActionInvocationSpy: NSObject {
    
    var actionInvocations: Int = 0
    
    @objc func action(_ sender: UIGestureRecognizer) {
        actionInvocations += 1
    }
}
