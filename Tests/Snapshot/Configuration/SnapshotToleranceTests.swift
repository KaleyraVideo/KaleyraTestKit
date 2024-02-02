// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import XCTest
import SwiftHamcrest
import KaleyraTestKit
import KaleyraSnapshotTest

final class SnapshotToleranceTests: UnitTestCase {

    func testZeroShouldCreateSnapshotToleranceValueWithZeroPerPixelAndZeroOverallValues() {
        let sut = SnapshotTolerance.zero

        assertThat(sut.perPixel, equalTo(.zero))
        assertThat(sut.overall, equalTo(.zero))
    }
}
