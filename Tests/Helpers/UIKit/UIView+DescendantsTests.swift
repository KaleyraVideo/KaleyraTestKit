// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import XCTest
#if canImport(Hamcrest)
import Hamcrest
#elseif canImport(SwiftHamcrest)
import SwiftHamcrest
#endif
import BandyerTestKit

final class UIView_DescendantsTests: UnitTestCase {
    
    private let sut = UIView()

    // MARK: All descendants

    func testAllDescendantsReturnsEmptyArrayWhenViewHasNoChildren() {
        assertThat(sut.allDescendants(), empty())
    }
    
    func testAllDescendantsReturnsArrayContainingAllViewChildrenInSortedOrder() {
        sut.addSubview(A)
        sut.addSubview(B)
        
        assertThat(sut.allDescendants(), equalTo([A, B]))
    }
    
    func testAllDescendantsFlattensViewHierarchyReturningAllDirectAndIndirectDescendantsWithAFlatMapStrategy() {
        createComplexViewHierarchy()
        
        let expectedDescendents = [A, B, C, A1, A2, A1X, A1Y, A1Z, A2X, B1, B2, B3]
        assertThat(sut.allDescendants(), equalTo(expectedDescendents))
    }
    
    func testAllDescendantsReturnsNilWhenNoneOfTheDescendantIsIdentifiedByTheIdentifierProvided() {
        createSimpleViewHierarchy()
        
        assertThat(sut.firstDescendant(identifiedBy: "foo"), nilValue())
    }

    func testAllDescendantsIdentifiedByReturnsAnArrayOfDescendantsIdentifiedByTheAccessibilityIdentifierProvided() {
        createComplexViewHierarchy()

        A1.accessibilityIdentifier = "foo"
        A2.accessibilityIdentifier = "foo"
        A1X.accessibilityIdentifier = "foo"
        B1.accessibilityIdentifier = "foo"

        assertThat(sut.allDescendants(identifiedBy: "foo"), equalTo([A1, A2, A1X, B1]))
    }

    // MARK: First Descendant identified by accessibility id
    
    func testFirstDescendantIdentifiedByReturnsTheFirstDescendantIdentifiedByTTheIdentifierProvidedInASimpleViewHierarchy() {
        let identifier = "foo"
        B.accessibilityIdentifier = identifier
        
        createSimpleViewHierarchy()
        
        assertThat(sut.firstDescendant(identifiedBy: identifier), equalTo(B))
    }
    
    func testFirstDescendantIdentiedByReturnsTheFirstDescendantIdentifiedByTheIdentifierProvidedInAComplexViewHierarchy() {
        let identifier = "foo"
        A1Z.accessibilityIdentifier = identifier
        
        createComplexViewHierarchy()
        
        assertThat(sut.firstDescendant(identifiedBy: identifier), equalTo(A1Z))
    }

    // MARK: All descendants of type

    func testAllDescendantsOfTypeReturnsAllDescendantsOfTheInferredType() {
        let firstButton = UIButton(type: .system)
        let view = UIView()
        let secondButton = UIButton(type: .system)
        let thirdButton = UIButton(type: .system)
        view.addSubview(firstButton)
        sut.addSubview(view)
        sut.addSubview(secondButton)
        sut.addSubview(thirdButton)

        let buttons: [UIButton] = sut.allDescendants()

        assertThat(buttons, equalTo([secondButton, thirdButton, firstButton]))
    }

    func testAllDescendantsOfTypeReturnsAllDescendantsOfTheSpecifiedType() {
        let firstButton = UIButton(type: .system)
        let view = UIView()
        let secondButton = UIButton(type: .system)
        let thirdButton = UIButton(type: .system)
        view.addSubview(firstButton)
        sut.addSubview(view)
        sut.addSubview(secondButton)
        sut.addSubview(thirdButton)

        let buttons: [UIView] = sut.allDescendants(ofType: UIButton.self)

        assertThat(buttons, equalTo([secondButton, thirdButton, firstButton]))
    }

    // MARK: First descendant of type

    func testFirstDescendantOfTypeReturnsFirstDescendantOfTheInferredType() {
        let firstButton = UIButton(type: .system)
        firstButton.setTitle("first", for: .normal)
        let secondButton = UIButton(type: .system)
        secondButton.setTitle("second", for: .normal)
        let view = UIView()
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        sut.addSubview(view)

        let button: UIButton? = sut.firstDescendant()

        assertThat(button, presentAnd(sameInstance(firstButton)))
    }

    func testFirstDescendantOfTypeReturnsFirstDescendantOfTheSpecifiedType() {
        let firstButton = UIButton(type: .system)
        firstButton.setTitle("first", for: .normal)
        let secondButton = UIButton(type: .system)
        secondButton.setTitle("second", for: .normal)
        let view = UIView()
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        sut.addSubview(view)

        let button = sut.firstDescendant(ofType: UIButton.self)

        assertThat(button, presentAnd(sameInstance(firstButton)))
    }

    func testFirstDescendantOfTypeIdentifiedByReturnsFirstDescendantOfTheSpecifiedTypeIdentifiedByTheAccessibilityIdentifierProvided() {
        let firstButton = UIButton(type: .system)
        firstButton.setTitle("first", for: .normal)
        firstButton.accessibilityIdentifier = "firstButton"
        let secondButton = UIButton(type: .system)
        secondButton.setTitle("second", for: .normal)
        let view = UIView()
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        sut.addSubview(view)

        let button = sut.firstDescendant(ofType: UIButton.self, identifiedBy: "firstButton")

        assertThat(button, presentAnd(sameInstance(firstButton)))
    }

    // MARK: First subview of type

    func testFirstSubviewOfTypeReturnsTheFirstSubviewOfTheInferredType() {
        let firstButton = UIButton(type: .system)
        let view = UIView()
        let secondButton = UIButton(type: .system)
        view.addSubview(firstButton)
        sut.addSubview(view)
        sut.addSubview(secondButton)

        let button: UIButton? = sut.firstSubview()

        assertThat(button, presentAnd(sameInstance(secondButton)))
    }

    func testFirstSubviewOfTypeReturnsTheFirstSubviewOfTheSpecifiedType() {
        let firstButton = UIButton(type: .system)
        let view = UIView()
        let secondButton = UIButton(type: .system)
        view.addSubview(firstButton)
        sut.addSubview(view)
        sut.addSubview(secondButton)

        let button = sut.firstSubview(ofType: UIButton.self)

        assertThat(button, presentAnd(sameInstance(secondButton)))
    }

    // MARK: All subviews of type

    func testAllSubviewsOfTypeReturnsAllSubviewsOfTheInferredType() {
        let firstButton = UIButton(type: .system)
        let view = UIView()
        let secondButton = UIButton(type: .system)
        let thirdButton = UIButton(type: .system)
        view.addSubview(firstButton)
        sut.addSubview(view)
        sut.addSubview(secondButton)
        sut.addSubview(thirdButton)

        let buttons: [UIButton] = sut.allSubviews()

        assertThat(buttons, equalTo([secondButton, thirdButton]))
    }

    func testAllSubviewsOfTypeReturnsAllSubviewsOfTheSpecifiedType() {
        let firstButton = UIButton(type: .system)
        let view = UIView()
        let secondButton = UIButton(type: .system)
        let thirdButton = UIButton(type: .system)
        view.addSubview(firstButton)
        sut.addSubview(view)
        sut.addSubview(secondButton)
        sut.addSubview(thirdButton)

        let buttons = sut.allSubviews(ofType: UIButton.self)

        assertThat(buttons, equalTo([secondButton, thirdButton]))
    }
    
    //MARK: Helpers
    
    //Children
    private let A = UIView()
    private let B = UIView()
    private let C = UIView()
    
    //Grand children
    private let A1 = UIView()
    private let A2 = UIView()
    
    private let B1 = UIView()
    private let B2 = UIView()
    private let B3 = UIView()
    
    //Grand grand children
    private let A1X = UIView()
    private let A1Y = UIView()
    private let A1Z = UIView()
    
    private let A2X = UIView()
    
    private func createSimpleViewHierarchy() {
        sut.addSubview(A)
        sut.addSubview(B)
    }
    
    private func createComplexViewHierarchy() {
        sut.addSubview(A)
        sut.addSubview(B)
        sut.addSubview(C)
        
        A.addSubview(A1)
        A.addSubview(A2)
        
        A1.addSubview(A1X)
        A1.addSubview(A1Y)
        A1.addSubview(A1Z)
        
        A2.addSubview(A2X)
        
        B.addSubview(B1)
        B.addSubview(B2)
        B.addSubview(B3)
    }
}
