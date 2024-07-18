// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE for licensing information

import Foundation
import UIKit

public struct SnapshotVariant: Equatable {

    public class Builder {

        public static let all: Builder = {
            Builder(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .large)
                .add(orientation: .landscape)
                .add(style: .dark)
                .add(layoutDirection: .rightToLeft)
                .add(contentSizes: Screen.ContentSize.allCases)
                .add(multitaskingModes: Screen.MultitaskingMode.allCases)
        }()

        public static let `default`: Builder = {
            return Builder(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .large)
                .add(orientation: .landscape)
                .add(style: .dark)
                .add(multitaskingModes: Screen.MultitaskingMode.allCases)
        }()

        private var orientations = Set<Screen.Orientation>()
        private var styles = Set<Screen.Style>()
        private var layoutDirections = Set<Screen.LayoutDirection>()
        private var contentSizes = Set<Screen.ContentSize>()
        private var multitaskingModes = Set<Screen.MultitaskingMode>()

        public init(orientation: Screen.Orientation, style: Screen.Style = .light, layoutDirection: Screen.LayoutDirection = .leftToRight, contentSize: Screen.ContentSize = .large) {
            self.orientations.insert(orientation)
            self.styles.insert(style)
            self.layoutDirections.insert(layoutDirection)
            self.contentSizes.insert(contentSize)
        }

        @discardableResult public func add(orientation: Screen.Orientation) -> Self {
            orientations.insert(orientation)
            return self
        }

        @discardableResult public func add(style: Screen.Style) -> Self {
            styles.insert(style)
            return self
        }

        @discardableResult public func add(layoutDirection: Screen.LayoutDirection) -> Self {
            layoutDirections.insert(layoutDirection)
            return self
        }

        @discardableResult public func add(contentSize: Screen.ContentSize) -> Self {
            contentSizes.insert(contentSize)
            return self
        }

        @discardableResult public func add(contentSizes: [Screen.ContentSize]) -> Self {
            contentSizes.forEach { contentSize in
                add(contentSize: contentSize)
            }
            return self
        }

        @discardableResult public func add(multitaskingMode: Screen.MultitaskingMode) -> Self {
            multitaskingModes.insert(multitaskingMode)
            return self
        }

        @discardableResult public func add(multitaskingModes: [Screen.MultitaskingMode]) -> Self {
            multitaskingModes.forEach { mode in
                add(multitaskingMode: mode)
            }
            return self
        }

        public func build() -> [SnapshotVariant] {
            var variants = [SnapshotVariant]()
            let multitaskingModes = multitaskingModesArray()
            orientations.forEach { orientation in
                styles.forEach { style in
                    layoutDirections.forEach { layoutDirection in
                        contentSizes.forEach { contentSize in
                            multitaskingModes.forEach { multitaskingMode in
                                let variant = SnapshotVariant(orientation: orientation, style: style, layoutDirection: layoutDirection, contentSize: contentSize, multitaskingMode: multitaskingMode)
                                variants.append(variant)
                            }
                        }
                    }
                }
            }
            return variants
        }

        private func multitaskingModesArray() -> [Screen.MultitaskingMode?] {
            guard !multitaskingModes.isEmpty else { return [nil] }
            var array: [Screen.MultitaskingMode?] = Array(multitaskingModes)
            array.append(nil)
            return array
        }
    }

    public let orientation: Screen.Orientation
    public let style: Screen.Style
    public let layoutDirection: Screen.LayoutDirection
    public let contentSize: Screen.ContentSize
    public let multitaskingMode: Screen.MultitaskingMode?

    public init(orientation: Screen.Orientation, style: Screen.Style = .light, layoutDirection: Screen.LayoutDirection = .leftToRight, contentSize: Screen.ContentSize = .large, multitaskingMode: Screen.MultitaskingMode? = nil) {
        self.orientation = orientation
        self.style = style
        self.layoutDirection = layoutDirection
        self.contentSize = contentSize
        self.multitaskingMode = multitaskingMode
    }
}

public extension SnapshotVariant {

    var traitCollection: UITraitCollection {
        var traits = [UITraitCollection?]()
        traits.append(style.traitCollection)
        traits.append(layoutDirection.traitCollection)
        traits.append(contentSize.traitCollection)

        return UITraitCollection(traitsFrom: traits.compactMap({$0}))
    }

}

public extension SnapshotVariant {

    func configuration(for device: Device) throws -> SnapshotConfiguration {
        if device.family == .phone && multitaskingMode != .none {
            throw UnsupportedSnapshotConfigurationError()
        }

        let screenSize = try device.screenSizeFor(orientation: orientation, multitaskingMode: multitaskingMode)
        let screenSizeClasses = try device.screenSizeClassesFor(orientation: orientation, multitaskingMode: multitaskingMode)
        return SnapshotConfiguration(size: screenSize,
                                     safeAreaInsets: device.safeAreaInsetsFor(orientation: orientation),
                                     layoutMargins: .zero,
                                     traitCollection: UITraitCollection(traitsFrom: [traitCollection, screenSizeClasses.traitCollection]))
    }
}

extension SnapshotVariant: CustomStringConvertible {

    public var description: String {
        var desc = "\(orientationDesc)-\(styleDesc)-\(layoutDirectionDesc)-\(contentSizeDesc)"

        if let _ = multitaskingMode {
            desc += "-\(multitaskingModeDesc)"
        }

        return desc
    }

    private var orientationDesc: String {
        switch orientation {
            case .portrait:
                return "portrait"
            case .landscape:
                return "landscape"
        }
    }

    private var styleDesc: String {
        switch style {
            case .light:
                return "light"
            case .dark:
                return "dark"
        }
    }

    private var layoutDirectionDesc: String {
        switch layoutDirection {
            case .leftToRight:
                return "LTR"
            case .rightToLeft:
                return "RTL"
        }
    }

    private var contentSizeDesc: String {
        switch contentSize {
            case .extraSmall:
                return "XS"
            case .small:
                return "S"
            case .medium:
                return "M"
            case .large:
                return "L"
            case .extraLarge:
                return "XL"
            case .extraExtraLarge:
                return "XXL"
            case .extraExtraExtraLarge:
                return "XXXL"
        }
    }

    private var multitaskingModeDesc: String {
        switch multitaskingMode {
            case .none:
                return ""
            case .oneThird:
                return "oneThird"
            case .half:
                return "half"
            case .twoThird:
                return "twoThird"
        }
    }
}
