// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation

@objc(BTKStopwatch)
public class Stopwatch: NSObject {

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

    @objc
    public var elapsedTimeInNanoseconds: UInt64 {
        guard let start = startTime,
              let end = endTime else {
            return 0
        }

        let startNanosec = start.uptimeNanoseconds
        let endNanosec = end.uptimeNanoseconds
        return endNanosec - startNanosec
    }

    @objc
    public func start() {
        endTime = nil
        startTime = DispatchTime.now()
    }

    @objc
    public func stop() {
        endTime = DispatchTime.now()
    }
}
