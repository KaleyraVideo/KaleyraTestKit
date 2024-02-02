// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import Foundation

public extension OperatingSystemVersion {
    
    init(_ major: UInt) {
        self.init(majorVersion: Int(major), minorVersion: 0, patchVersion: 0)
    }
    
    init(_ major: UInt, _ minor: UInt, _ patch: UInt) {
        self.init(majorVersion: Int(major), minorVersion: Int(minor), patchVersion: Int(patch))
    }
}

extension OperatingSystemVersion: CustomStringConvertible {
    
    public var description: String {
        patchVersion > 0 ? longFormat : shortFormat
    }
    
    private var shortFormat: String {
        return "\(majorVersion).\(minorVersion)"
    }
    
    private var longFormat: String {
        return shortFormat + "." + String(describing: patchVersion)
    }
}
