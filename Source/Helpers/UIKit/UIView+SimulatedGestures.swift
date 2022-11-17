// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import UIKit

public extension UIView {
    
    func simulateTapRecognition(file: StaticString = #filePath, line: UInt = #line) throws {
        try simulateGestureRecognition(UITapGestureRecognizer.self, file: file, line: line)
    }
    
    func simulateSwipeRecognition(file: StaticString = #filePath, line: UInt = #line) throws {
        try simulateGestureRecognition(UISwipeGestureRecognizer.self, file: file, line: line)
    }

    func simulateLongPressRecognition(file: StaticString = #filePath, line: UInt = #line) throws {
        try simulateGestureRecognition(UILongPressGestureRecognizer.self, file: file, line: line)
    }

    func simulateGestureRecognition<Recognizer: UIGestureRecognizer>(_ type: Recognizer.Type,
                                                                    file: StaticString = #filePath,
                                                                    line: UInt = #line) throws {
        let recognizers = allRecognizersEnabled(Recognizer.self)

        guard !recognizers.isEmpty else {
            throw GestureRecognizerNotFoundError()
        }

        recognizers.forEach { invokeAction(on: $0) }
    }

    private func allRecognizers<Recognizer: UIGestureRecognizer>(_ type: Recognizer.Type) -> [Recognizer] {
        gestureRecognizers?.compactMap({ $0 as? Recognizer }) ?? []
    }

    private func allRecognizersEnabled<Recognizer: UIGestureRecognizer>(_ type: Recognizer.Type) -> [Recognizer] {
        allRecognizers(Recognizer.self).filter({ $0.isEnabled })
    }

    private func invokeAction(on recognizer: UIGestureRecognizer) {
        let invoker = GestureRecognizerActionsInvoker()
        invoker.invokeActions(on: recognizer)
    }
}

struct GestureRecognizerNotFoundError: Error {}
