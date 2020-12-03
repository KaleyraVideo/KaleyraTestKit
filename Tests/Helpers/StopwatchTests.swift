// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import XCTest
import Hamcrest
@testable import BandyerTestKit

class StopwatchTests: UnitTestCase {

    func testElapsedTimeReturnsNeverWhenStartTimeIsNil() {
        let sut = makeSUTStub(startTime: nil, endTime: DispatchTime.distantFuture)

        assertThat(sut.elapsedTime, equalTo(.never))
    }

    func testElapsedTimeReturnsNeverWhenEndTimeIsNil() {
        let sut = makeSUTStub(startTime: DispatchTime.now(), endTime: nil)

        assertThat(sut.elapsedTime, equalTo(.never))
    }

    func testElapsedTimeReturnsDifferenceBetweenEndAndStartTimes() {
        let now = DispatchTime.now()
        let sut = makeSUTStub(startTime: now, endTime: now + .seconds(1))

        assertThat(sut.elapsedTime, equalTo(.seconds(1)))
    }

    func testStartResetsStopTime() {
        let sut = Stopwatch()
        sut.start()

        sut.stop()
        assertThat(sut.endTime, present())

        sut.start()
        assertThat(sut.endTime, nilValue())
    }

    // MARK: Helpers

    private func makeSUTStub(startTime: DispatchTime?, endTime: DispatchTime?) -> StopwatchStub {
        StopwatchStub(simulatedStartTime: startTime, simulatedEndTime: endTime)
    }
}

private final class StopwatchStub: Stopwatch {

    private let simulatedStartTime: DispatchTime?
    private let simulatedEndTime: DispatchTime?

    override var startTime: DispatchTime? {
        simulatedStartTime
    }

    override var endTime: DispatchTime? {
        simulatedEndTime
    }

    init(simulatedStartTime: DispatchTime?, simulatedEndTime: DispatchTime?) {
        self.simulatedStartTime = simulatedStartTime
        self.simulatedEndTime = simulatedEndTime
    }
}
