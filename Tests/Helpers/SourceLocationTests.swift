// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import XCTest
import Hamcrest
import BandyerTestKit

class SourceLocationTests: BTKUnitTestCase {

    func testDescription() {
        let sut = SourceLocation(file: #file, line: #line)
        assertThat(sut.description, equalTo("file: \(sut.file) at line: \(sut.line)"))
    }
}
