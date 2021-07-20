// Copyright © 2021 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation

public enum SnapshotTestCaseRunStrategy {

    case auto
    case manual(Device)
    case all

    var devices: [Device] {
        switch self {
            case .auto:
                if ProcessInfo.processInfo.environment["SNAPSHOT_TEST_RUN_STRATEGY"] == "manual" {
                    return Self.manual(Device(model: .iPhone6s)).devices
                } else {
                    return Self.all.devices
                }
            case .manual(let device):
                return [device]
            case .all:
                return Device.all
        }
    }
}
