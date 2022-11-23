// Copyright © 2022 Kaleyra S.p.a. All rights reserved.
// See LICENSE.txt for licensing information

import XCTest
import Hamcrest
import BandyerTestKit

final class Array_VoidTests: UnitTestCase {

    func testAppendShouldAppendANewElementToTheArray() {
        var array: [Void] = [Void]()

        array.append()

        assertThat(array.count, equalTo(1))
    }
}
