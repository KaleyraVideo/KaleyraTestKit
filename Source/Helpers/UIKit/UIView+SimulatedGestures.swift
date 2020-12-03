// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import UIKit

public extension UIView {
    
    func simulateTapRecognition(_ value: @autoclosure () throws -> Void = XCTFail("Could not locate any tap gesture recognizer in the view provided", file: #filePath, line: #line), file: StaticString = #filePath, line: UInt = #line) {
        guard let recognizers = gestureRecognizers else {
            try! value()
            return
        }

        let tapRecognizers = recognizers.compactMap({ $0 as? UITapGestureRecognizer})

        guard !tapRecognizers.isEmpty else {
            try! value()
            return
        }

        tapRecognizers.forEach { invokeAction(on: $0) }
    }
    
    func simulateSwipeRecognition(_ value: @autoclosure () throws -> Void = XCTFail("Could not locate any swipe gesture recognizer in the view provided", file: #filePath, line: #line), file: StaticString = #filePath, line: UInt = #line) {
        guard let recognizers = gestureRecognizers else {
            try! value()
            return
        }

        let swipeRecognizers = recognizers.compactMap({ $0 as? UISwipeGestureRecognizer})

        guard !swipeRecognizers.isEmpty else {
            try! value()
            return
        }

        swipeRecognizers.forEach { invokeAction(on: $0) }
    }
    
    private func invokeAction(on recognizer: UIGestureRecognizer) {
        let invoker = GestureRecognizerActionsInvoker()
        invoker.invokeActions(on: recognizer)
    }
}
