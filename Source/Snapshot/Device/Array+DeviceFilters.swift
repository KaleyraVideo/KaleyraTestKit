// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import Foundation
import UIKit

public extension Array where Element == Device {

    var models: [Device.Model] {
        compactMap({ $0.model })
    }

    func compatible(with version: Version) -> [Device] {
        filter { device in
            device.operatingSystems.contains(version)
        }
    }

    func compatible(with screenScale: Screen.Scale) -> [Device] {
        filter { device in
            device.screenScale == screenScale
        }
    }

    func compatible(with family: Device.Family) -> [Device] {
        filter { device in
            device.family == family
        }
    }

    func compatible(with userInterfaceIdiom: UIUserInterfaceIdiom) -> [Device] {
        guard let family = Device.Family(userInterfaceIdiom: userInterfaceIdiom) else { return [] }
        return compatible(with: family)
    }

    func compatible(with device: UIDevice) -> [Device] {
        guard let version = Version(device.systemVersion) else { return [] }
        return compatible(with: version)
                .compatible(with: device.userInterfaceIdiom)
    }

    func uniqueByScreenSize() -> [Device] {
        var uniqueDevices = [Device]()

        forEach { device in
            guard !uniqueDevices.contains(device) else { return }
            let screenSizes = uniqueDevices.compactMap({ $0.screenSize })
            guard !screenSizes.contains(device.screenSize) else { return }
            uniqueDevices.append(device)
        }

        return uniqueDevices
    }
}
