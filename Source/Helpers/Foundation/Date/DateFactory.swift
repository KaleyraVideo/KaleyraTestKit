// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE for licensing information

import Foundation

@available(iOS 12.0, *)
enum DateCreationError: Error {
    case invalidDate(DateComponents)
}

@available(iOS 12.0, *)
public protocol DateFactory {

    func makeDate(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, millisecond: Int, timezone: TimeZone?) throws -> Date
    static func makeDate(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, millisecond: Int, timezone: TimeZone?) throws -> Date
}

@available(iOS 12.0, *)
public extension DateFactory {

    func makeDate(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, millisecond: Int = 0, timezone: TimeZone? = TimeZone(abbreviation: "UTC")) throws -> Date {
        try Self.makeDate(year: year, month: month, day: day, hour: hour, minute: minute, second: second, millisecond: millisecond, timezone: timezone)
    }

    static func makeDate(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, millisecond: Int, timezone: TimeZone?) throws -> Date {
        let components = DateComponents(calendar: .current,
                                        timeZone: timezone,
                                        era: nil,
                                        year: year,
                                        month: month,
                                        day: day,
                                        hour: hour,
                                        minute: minute,
                                        second: second,
                                        nanosecond: millisecond * Int(NSEC_PER_MSEC),
                                        weekday: nil,
                                        weekdayOrdinal: nil,
                                        quarter: nil,
                                        weekOfMonth: nil,
                                        weekOfYear: nil,
                                        yearForWeekOfYear: nil)
        guard let date = components.date else {
            throw DateCreationError.invalidDate(components)
        }
        return date
    }
}

@available(iOS 12.0, *)
extension Date: DateFactory {

    public init(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int = 0, millisecond: Int = 0, timeZone: TimeZone? = TimeZone(abbreviation: "UTC")) throws {
        self = try Date.makeDate(year: year, month: month, day: day, hour: hour, minute: minute, second: second, millisecond: millisecond, timezone: timeZone)
    }
}
