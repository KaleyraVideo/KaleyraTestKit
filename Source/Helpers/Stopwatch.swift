// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import Foundation
import Dispatch

public class Stopwatch {

    internal private(set) var startTime: DispatchTime?
    internal private(set) var endTime: DispatchTime?

    public var elapsedTime: DispatchTimeInterval {
        guard let start = startTime,
              let end = endTime else {
            return DispatchTimeInterval.never
        }

        if #available(iOS 13.0, *) {
            return start.distance(to: end)
        } else {
            return .nanoseconds(Int(elapsedTimeInNanoseconds))
        }
    }

    public var elapsedTimeInNanoseconds: UInt64 {
        guard let start = startTime,
              let end = endTime else {
            return 0
        }

        let startNanosec = start.uptimeNanoseconds
        let endNanosec = end.uptimeNanoseconds
        return endNanosec - startNanosec
    }

    public func start() {
        endTime = nil
        startTime = DispatchTime.now()
    }

    public func stop() {
        endTime = DispatchTime.now()
    }
}
