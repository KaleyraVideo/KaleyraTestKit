// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import UIKit

public extension UIView {

    struct GestureRecognizerNotFoundError: Error {}

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
        let recognizers = allEnabledRecognizers(Recognizer.self)

        guard !recognizers.isEmpty else {
            throw GestureRecognizerNotFoundError()
        }

        recognizers.forEach { invokeAction(on: $0) }
    }

    private func allRecognizers<Recognizer: UIGestureRecognizer>(_ type: Recognizer.Type) -> [Recognizer] {
        gestureRecognizers?.compactMap({ $0 as? Recognizer }) ?? []
    }

    private func allEnabledRecognizers<Recognizer: UIGestureRecognizer>(_ type: Recognizer.Type) -> [Recognizer] {
        allRecognizers(Recognizer.self).filter({ $0.isEnabled })
    }

    private func invokeAction(on recognizer: UIGestureRecognizer) {
        Invoker.invokeActions(on: recognizer)
    }

    private enum Invoker {

        static func invokeActions(on recognizer: UIGestureRecognizer) {
            let targetClass: AnyClass? = NSClassFromString("UIGestureRecognizerTarget")
            guard let targetIvar = class_getInstanceVariable(targetClass, "_target") else { return }
            guard let actionIvar = class_getInstanceVariable(targetClass, "_action") else { return }
            guard let targets = recognizer.value(forKey: "targets") as? [AnyObject] else { return }

            for target in targets {
                let targetObject = object_getIvar(target, targetIvar) as AnyObject
                let selector = (Unmanaged.passUnretained(target).toOpaque() + ivar_getOffset(actionIvar)).assumingMemoryBound(to: Selector.self)

                _ = targetObject.perform(selector.pointee, with: recognizer)
            }
        }
    }
}
