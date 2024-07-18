// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import Foundation
import UIKit
import XCTest
import KaleyraTestHelpers

public protocol UIWindowAwareTestCase: XCTestCase {

    func makeWindow() -> UIWindow
    func show(window: UIWindow, asKey: Bool, controller: UIViewController)
    func showInKeyWindow(controller: UIViewController) -> UIWindow
}

public extension UIWindowAwareTestCase {

    func makeWindow() -> UIWindow {
        .init(windowScene: UIApplication.shared.connectedScenes.first as! UIWindowScene)
    }

    func show(window: UIWindow, asKey isKey: Bool, controller: UIViewController) {
        let _ = controller.view
        let observer = addObserver(to: controller)
        window.show(controller: controller, asKeyWindow: isKey)
        wait(untilViewHasAppeared: observer)

        hideWindowOnTeardown(window, observer: observer)
    }

    private func addObserver(to controller: UIViewController) -> UIViewControllerObserver {
        let observer = UIViewControllerObserver()
        controller.addChild(observer)
        controller.view.insertSubview(observer.view, at: 0)
        observer.didMove(toParent: controller)
        return observer
    }

    private func wait(untilViewHasAppeared observer: UIViewControllerObserver) {
        while !observer.hasViewAppeared {
            RunLoop.current.run(mode: .default, before: Date.distantFuture)
        }
    }

    func showInKeyWindow(controller: UIViewController) -> UIWindow {
        let window = makeWindow()
        show(window: window, asKey: true, controller: controller)
        return window
    }

    private func hideWindowOnTeardown(_ window: UIWindow, observer: UIViewControllerObserver) {
        addTeardownBlock {
            window.hideForRelease()

            while !observer.hasViewDisappeared {
                RunLoop.current.run(mode: .default, before: Date.distantFuture)
            }
        }
    }
}

public extension UIWindow {

    func show(controller: UIViewController, asKeyWindow isKey: Bool) {
        rootViewController = controller

        if isKey {
            makeKeyAndVisible()
        } else {
            isHidden = false
        }
    }

    func hideForRelease() {
        isHidden = true
        rootViewController = nil
        windowScene = nil
    }
}
