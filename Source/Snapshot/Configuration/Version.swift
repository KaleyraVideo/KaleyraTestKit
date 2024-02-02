// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE for licensing information

import Foundation

public struct Version: Comparable {

    public static let max = Version(major: UInt.max)

    public let major: UInt
    public let minor: UInt

    public init(_ major: UInt, _ minor: UInt = 0) {
        self.init(major: major, minor: minor)
    }

    public init(osVersion: OperatingSystemVersion) {
        self.init(major: UInt(osVersion.majorVersion), minor: UInt(osVersion.minorVersion))
    }

    public init(major: UInt, minor: UInt = 0) {
        self.major = major
        self.minor = minor
    }

    public static func < (lhs: Version, rhs: Version) -> Bool {
        if lhs.major < rhs.major {
            return true
        } else if lhs.major == rhs.major {
            if lhs.minor < rhs.minor {
                return true
            }
        }

        return false
    }

}

public extension Version {

    init?(_ stringLiteral: String) {
        let components = stringLiteral.components(separatedBy: ".")
        guard components.count >= 1 else { return nil }
        guard let major = UInt(components[0]) else { return nil }

        if components.count >= 2 {
            guard let minor = UInt(components[1]) else { return nil}
            self.init(major, minor)
        } else {
            self.init(major, 0)
        }
    }
}
