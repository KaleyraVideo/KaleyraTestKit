// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE for licensing information

import Foundation

public extension TimeZone {
    static let UTCPlus6 = TimeZone(secondsFromGMT: 21_600)
    static let UTCMinus6 = TimeZone(secondsFromGMT: -21_600)
    static let CET = TimeZone(abbreviation: "CET")
}
