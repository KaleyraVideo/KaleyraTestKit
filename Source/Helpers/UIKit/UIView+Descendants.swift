// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import UIKit

public extension UIView {
    
    func allDescendants() -> [UIView] {
        subviews + subviews.flatMap{ $0.allDescendants() }
    }

    func allDescendants(identifiedBy accessibilityIdentifier: String) -> [UIView] {
        allDescendants().filter { $0.accessibilityIdentifier == accessibilityIdentifier }
    }

    func allDescendants<T: UIView>() -> [T] {
        allDescendants().compactMap { $0 as? T }
    }

    func firstDescendant<T: UIView> () -> T? {
        allDescendants().first
    }

    func firstDescendant<T: UIView> (identifiedBy accessibilityIdentifier: String) -> T? {
        allDescendants().first { $0.accessibilityIdentifier == accessibilityIdentifier }
    }

    func allSubviews<T: UIView>() -> [T] {
        subviews.compactMap { $0 as? T }
    }

    func firstSubview<T: UIView> () -> T? {
        allSubviews().first
    }
}

public extension UIView {

    func allDescendants(ofType type: AnyClass) -> [UIView] {
        allDescendants().filter { $0.isKind(of: type) }
    }

    func firstDescendant(ofType type: AnyClass) -> UIView? {
        allDescendants(ofType: type).first
    }

    func firstDescendant(ofType type: AnyClass, identifiedBy accessibilityIdentifier: String) -> UIView? {
        allDescendants(ofType: type).filter({ $0.accessibilityIdentifier == accessibilityIdentifier }).first
    }

    func allSubviews(ofType type: AnyClass) -> [UIView] {
        allSubviews().filter { $0.isKind(of: type) }
    }

    func firstSubview(ofType type: AnyClass) -> UIView? {
        allSubviews(ofType: type).first
    }
}
