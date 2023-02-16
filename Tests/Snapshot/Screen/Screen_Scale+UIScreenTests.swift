// Copyright © 2021 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import XCTest
import UIKit
#if canImport(Hamcrest)
import Hamcrest
#elseif canImport(SwiftHamcrest)
import SwiftHamcrest
#endif
import BandyerTestKit

class Screen_UIScreenTests: UnitTestCase {

    func testScreenScaleFromUIScreenWithScaleEqualToOneShouldReturnMatchingScreenScale() {
        let screen = FakeScreen()
        screen.overriddenScale = 1

        let sut = Screen.Scale(screen)

        assertThat(sut, presentAnd(equalTo(.x1)))
    }

    func testScreenScaleFromUIScreenWithScaleEqualToTwoShouldReturnMatchingScreenScale() {
        let screen = FakeScreen()
        screen.overriddenScale = 2

        let sut = Screen.Scale(screen)

        assertThat(sut, presentAnd(equalTo(.x2)))
    }

    func testScreenScaleFromUIScreenWithScaleEqualToThreeShouldReturnMatchingScreenScale() {
        let screen = FakeScreen()
        screen.overriddenScale = 3

        let sut = Screen.Scale(screen)

        assertThat(sut, presentAnd(equalTo(.x3)))
    }

    func testScreenScaleFromUIScreenWithScaleEqualToUnsupportedValueShouldReturnNil() {
        let screen = FakeScreen()
        screen.overriddenScale = 4

        let sut = Screen.Scale(screen)

        assertThat(sut, nilValue())
    }
}


private class FakeScreen: UIScreen {

    var overriddenScale: CGFloat?

    override var scale: CGFloat {
        guard let overriddenScale = overriddenScale else {
            return super.scale
        }
        return overriddenScale
    }
}
