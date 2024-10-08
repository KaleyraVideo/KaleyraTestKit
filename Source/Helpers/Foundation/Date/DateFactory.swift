// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE for licensing information

import Foundation

enum DateCreationError: Error {
    case invalidDate(DateComponents)
}

public protocol DateFactory {

    func makeDate(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, millisecond: Int, timezone: TimeZone?) throws -> Date
    static func makeDate(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, millisecond: Int, timezone: TimeZone?) throws -> Date
}

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

extension Date: DateFactory {

    public init(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int = 0, millisecond: Int = 0, timeZone: TimeZone? = TimeZone(abbreviation: "UTC")) throws {
        self = try Date.makeDate(year: year, month: month, day: day, hour: hour, minute: minute, second: second, millisecond: millisecond, timezone: timeZone)
    }

    public static var mayTen: Date {
        (try? .init(year: 2022, month: 5, day: 10, hour: 12, minute: 55)) ?? Date()
    }

    public static var mayEleven: Date {
        (try? .init(year: 2022, month: 5, day: 11, hour: 13, minute: 33)) ?? Date()
    }

    public static var mayTwelve: Date {
        (try? .init(year: 2022, month: 5, day: 12, hour: 13, minute: 33)) ?? Date()
    }

    public static var mayTwentyTwo: Date {
        (try? .init(year: 2022, month: 5, day: 22, hour: 12, minute: 55)) ?? Date()
    }
}
