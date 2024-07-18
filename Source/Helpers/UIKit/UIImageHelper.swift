// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE for licensing information

import UIKit

public class UIImageHelper {

    enum UIImageError: Error {
        case invalidImageName(String)
    }

    public static func makeImage(from name: String) throws -> UIImage {
        try makeImage(from: name, bundleFor: UIImageHelper.self)
    }

    public static func makeImage(from name: String, bundleFor aClass: AnyClass) throws -> UIImage {
        try makeImage(from: name, bundle: Bundle(for: aClass))
    }

    public static func makeImage(from name: String, bundle: Bundle) throws -> UIImage {
        guard let image = UIImage(named: name, in: bundle, compatibleWith: nil) else {
            throw UIImageError.invalidImageName(name)
        }
        return image
    }

    public static func makeImage(systemName name: String) throws -> UIImage {
        guard let image = UIImage(systemName: name, compatibleWith: nil) else {
            throw UIImageError.invalidImageName(name)
        }

        return image
    }
}
