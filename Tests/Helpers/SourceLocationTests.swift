// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import XCTest
#if canImport(Hamcrest)
import Hamcrest
#elseif canImport(SwiftHamcrest)
import SwiftHamcrest
#endif
import BandyerTestKit

final class SourceLocationTests: UnitTestCase {

    func testDescription() {
        let sut = SourceLocation(file: #file, line: #line)
        assertThat(sut.description, equalTo("file: \(sut.file) at line: \(sut.line)"))
    }
}
