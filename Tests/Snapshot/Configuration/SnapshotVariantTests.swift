// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import XCTest
import Hamcrest
@testable import BandyerTestKit

class SnapshotVariantTests: UnitTestCase, ConditionalTestCase {

    func testShouldReturnConfigurationWithSizeInformationForPortraitOrientation() throws {
        let variant = SnapshotVariant(orientation: .portrait)
        let device = makeiPhone()

        let config = try variant.configuration(for: device)

        assertThat(config.size, equalTo(device.screenSize))
        assertThat(config.safeAreaInsets, equalTo(device.safeAreaInsetsFor(orientation: .portrait)))
        assertThat(config.layoutMargins, equalTo(.zero))
    }

    func testShouldReturnConfigurationWithSizeInformationForLandscapeOrientation() throws {
        let variant = SnapshotVariant(orientation: .landscape)
        let device = makeiPhone()

        let config = try variant.configuration(for: device)

        assertThat(config.size, equalTo(device.screenSize.rotated))
        assertThat(config.safeAreaInsets, equalTo(device.safeAreaInsetsFor(orientation: .landscape)))
        assertThat(config.layoutMargins, equalTo(.zero))
    }

    @available(iOS 13.0, *)
    func testShouldReturnConfigurationContainingLightUserInterfaceStyleTraitIntoItsTraitCollection() throws {
        try run(ifVersionAtLeast: 13, "User interface style traits are not available until iOS 13.0", runnable: {
            let variant = SnapshotVariant(orientation: .portrait, style: .light)
            let device = makeiPhone()

            let config = try variant.configuration(for: device)

            assertThat(config.traitCollection.containsTraits(in: UITraitCollection(userInterfaceStyle: .light)), isTrue())
        })
    }

    @available(iOS 13.0, *)
    func testShouldReturnConfigurationContainingDarkUserInterfaceStyleTraitIntoItsTraitCollection() throws {
        try run(ifVersionAtLeast: 13, "User interface style traits are not available until iOS 13.0", runnable: {
            let variant = SnapshotVariant(orientation: .portrait, style: .dark)
            let device = makeiPhone()

            let config = try variant.configuration(for: device)

            assertThat(config.traitCollection.containsTraits(in: UITraitCollection(userInterfaceStyle: .dark)), isTrue())
        })
    }

    func testShouldReturnConfigurationContainingLeftToRightLayoutDirectionTraitIntoItsTraitCollection() throws {
        let variant = SnapshotVariant(orientation: .portrait, layoutDirection: .leftToRight)
        let device = makeiPhone()

        let config = try variant.configuration(for: device)

        assertThat(config.traitCollection.containsTraits(in: UITraitCollection(layoutDirection: .leftToRight)), isTrue())
    }

    func testShouldReturnConfigurationContainingRightToLeftLayoutDirectionTraitIntoItsTraitCollection() throws {
        let variant = SnapshotVariant(orientation: .portrait, layoutDirection: .rightToLeft)
        let device = makeiPhone()

        let config = try variant.configuration(for: device)

        assertThat(config.traitCollection.containsTraits(in: UITraitCollection(layoutDirection: .rightToLeft)), isTrue())
    }

    func testShouldReturnConfigurationContainingExtraSmallContentSizeTraitIntoItsTraitCollection() throws {
        let variant = SnapshotVariant(orientation: .portrait, contentSize: .extraSmall)
        let device = makeiPhone()

        let config = try variant.configuration(for: device)

        assertThat(config.traitCollection.containsTraits(in: UITraitCollection(preferredContentSizeCategory: .extraSmall)), isTrue())
    }

    func testShouldReturnConfigurationContainingSmallContentSizeTraitIntoItsTraitCollection() throws {
        let variant = SnapshotVariant(orientation: .portrait, contentSize: .small)
        let device = makeiPhone()

        let config = try variant.configuration(for: device)

        assertThat(config.traitCollection.containsTraits(in: UITraitCollection(preferredContentSizeCategory: .small)), isTrue())
    }

    func testShouldReturnConfigurationContainingMediumContentSizeTraitIntoItsTraitCollection() throws {
        let variant = SnapshotVariant(orientation: .portrait, contentSize: .medium)
        let device = makeiPhone()

        let config = try variant.configuration(for: device)

        assertThat(config.traitCollection.containsTraits(in: UITraitCollection(preferredContentSizeCategory: .medium)), isTrue())
    }

    func testShouldReturnConfigurationContainingLargeContentSizeTraitIntoItsTraitCollection() throws {
        let variant = SnapshotVariant(orientation: .portrait, contentSize: .large)
        let device = makeiPhone()

        let config = try variant.configuration(for: device)

        assertThat(config.traitCollection.containsTraits(in: UITraitCollection(preferredContentSizeCategory: .large)), isTrue())
    }

    func testShouldReturnConfigurationContainingExtraLargeContentSizeTraitIntoItsTraitCollection() throws {
        let variant = SnapshotVariant(orientation: .portrait, contentSize: .extraLarge)
        let device = makeiPhone()

        let config = try variant.configuration(for: device)

        assertThat(config.traitCollection.containsTraits(in: UITraitCollection(preferredContentSizeCategory: .extraLarge)), isTrue())
    }

    func testShouldReturnConfigurationContainingExtraExtraLargeContentSizeTraitIntoItsTraitCollection() throws {
        let variant = SnapshotVariant(orientation: .portrait, contentSize: .extraExtraLarge)
        let device = makeiPhone()

        let config = try variant.configuration(for: device)

        assertThat(config.traitCollection.containsTraits(in: UITraitCollection(preferredContentSizeCategory: .extraExtraLarge)), isTrue())
    }

    func testShouldReturnConfigurationContainingExtraExtraExtraLargeContentSizeTraitIntoItsTraitCollection() throws {
        let variant = SnapshotVariant(orientation: .portrait, contentSize: .extraExtraExtraLarge)
        let device = makeiPhone()

        let config = try variant.configuration(for: device)

        assertThat(config.traitCollection.containsTraits(in: UITraitCollection(preferredContentSizeCategory: .extraExtraExtraLarge)), isTrue())
    }

    func testShouldReturnConfigurationContainingSizeClassesTraitsForiPhoneInPortraitOrientation() throws {
        let variant = SnapshotVariant(orientation: .portrait)
        let device = makeiPhone()

        let config = try variant.configuration(for: device)

        assertThat(config.traitCollection.containsTraits(in: UITraitCollection(horizontalSizeClass: .compact)), isTrue())
        assertThat(config.traitCollection.containsTraits(in: UITraitCollection(verticalSizeClass: .regular)), isTrue())
    }

    func testShouldReturnConfigurationContainingSizeClassesTraitsForiPhoneInLandscapeOrientation() throws {
        let variant = SnapshotVariant(orientation: .landscape)
        let device = makeiPhone()

        let config = try variant.configuration(for: device)

        assertThat(config.traitCollection.containsTraits(in: UITraitCollection(horizontalSizeClass: .compact)), isTrue())
        assertThat(config.traitCollection.containsTraits(in: UITraitCollection(verticalSizeClass: .compact)), isTrue())
    }

    func testShouldReturnConfigurationContainingSizeClassesTraitsForiPadInPortraitOrientationInSplitOneThirdMode() throws {
        let variant = SnapshotVariant(orientation: .portrait, multitaskingMode: .oneThird)
        let device = makeiPad()

        let config = try variant.configuration(for: device)

        assertThat(config.traitCollection.containsTraits(in: UITraitCollection(horizontalSizeClass: .compact)), isTrue())
        assertThat(config.traitCollection.containsTraits(in: UITraitCollection(verticalSizeClass: .regular)), isTrue())
    }

    func testShouldReturnConfigurationContainingSizeClassesTraitsForiPadInLandscapeOrientationInSplitTwoThirdMode() throws {
        let variant = SnapshotVariant(orientation: .landscape, multitaskingMode: .twoThird)
        let device = makeiPad()

        let config = try variant.configuration(for: device)

        assertThat(config.traitCollection.containsTraits(in: UITraitCollection(horizontalSizeClass: .regular)), isTrue())
        assertThat(config.traitCollection.containsTraits(in: UITraitCollection(verticalSizeClass: .regular)), isTrue())
    }

    func testShouldReturnConfigurationContainingAllTraitForTheVariantBeforeiOS13() throws {
        try run(ifVersionBelow: 13, "User interface style is not available below iOS 13", runnable: {
            let variant = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .rightToLeft, contentSize: .extraExtraExtraLarge)
            let device = makeiPhone()

            let config = try variant.configuration(for: device)
            let expectedTraits = [
                UITraitCollection(layoutDirection: .rightToLeft),
                UITraitCollection(preferredContentSizeCategory: .extraExtraExtraLarge),
                UITraitCollection(horizontalSizeClass: .compact),
                UITraitCollection(verticalSizeClass: .regular)
            ]
            assertThat(config.traitCollection, equalTo(UITraitCollection(traitsFrom: expectedTraits)))
        })
    }

    @available(iOS 13.0, *)
    func testShouldReturnConfigurationContainingAllTraitForTheVariantAfteriOS13() throws {
        try run(ifVersionAtLeast: 13, "User interface style is not available below iOS 13", runnable: {
            let variant = SnapshotVariant(orientation: .portrait, style: .dark, layoutDirection: .rightToLeft, contentSize: .extraExtraExtraLarge)
            let device = makeiPhone()

            let config = try variant.configuration(for: device)
            let expectedTraits = [
                UITraitCollection(userInterfaceStyle: .dark),
                UITraitCollection(layoutDirection: .rightToLeft),
                UITraitCollection(preferredContentSizeCategory: .extraExtraExtraLarge),
                UITraitCollection(horizontalSizeClass: .compact),
                UITraitCollection(verticalSizeClass: .regular)
            ]
            assertThat(config.traitCollection, equalTo(UITraitCollection(traitsFrom: expectedTraits)))
        })
    }

    func testShouldReturnScreenSizeWithWidthDividedByOneThirdForiPadModelInOneThirdSplitScreenInPortraitOrientation() throws {
        let variant = SnapshotVariant(orientation: .portrait, multitaskingMode: .oneThird)
        let device = makeiPad()

        let config = try variant.configuration(for: device)

        assertThat(config.size, equalTo(device.screenSize.oneThird))
        assertThat(config.safeAreaInsets, equalTo(device.safeAreaInsetsFor(orientation: .portrait)))
        assertThat(config.layoutMargins, equalTo(.zero))
    }

    func testShouldReturnScreenSizeWithWidthDividedByTwoThirdForiPadModelInTwoThirdSplitScreenInPortraitOrientation() throws {
        let variant = SnapshotVariant(orientation: .portrait, multitaskingMode: .twoThird)
        let device = makeiPad()

        let config = try variant.configuration(for: device)

        assertThat(config.size, equalTo(device.screenSize.twoThird))
        assertThat(config.safeAreaInsets, equalTo(device.safeAreaInsetsFor(orientation: .portrait)))
        assertThat(config.layoutMargins, equalTo(.zero))
    }

    func testShouldReturnScreenSizeWithWidthDividedByOneThirdForiPadModelInOneThirdSplitScreenInLandscapeOrientation() throws {
        let variant = SnapshotVariant(orientation: .landscape, multitaskingMode: .oneThird)
        let device = makeiPad()

        let config = try variant.configuration(for: device)

        assertThat(config.size, equalTo(device.screenSize.rotated.oneThird))
        assertThat(config.safeAreaInsets, equalTo(device.safeAreaInsetsFor(orientation: .landscape)))
        assertThat(config.layoutMargins, equalTo(.zero))
    }

    func testShouldReturnScreenSizeWithWidthDividedByTwoThirdForiPadModelInTwoThirdSplitScreenInLandscapeOrientation() throws {
        let variant = SnapshotVariant(orientation: .landscape, multitaskingMode: .twoThird)
        let device = makeiPad()

        let config = try variant.configuration(for: device)

        assertThat(config.size, equalTo(device.screenSize.rotated.twoThird))
        assertThat(config.safeAreaInsets, equalTo(device.safeAreaInsetsFor(orientation: .landscape)))
        assertThat(config.layoutMargins, equalTo(.zero))
    }

    func testShouldReturnScreenSizeWithWidthDividedByHalfForiPadModelInHalfSplitScreenInLandscapeOrientation() throws {
        let variant = SnapshotVariant(orientation: .landscape, multitaskingMode: .half)
        let device = makeiPad()

        let config = try variant.configuration(for: device)

        assertThat(config.size, equalTo(device.screenSize.rotated.half))
        assertThat(config.safeAreaInsets, equalTo(device.safeAreaInsetsFor(orientation: .landscape)))
        assertThat(config.layoutMargins, equalTo(.zero))
    }

    func testShouldThrowUnsupportedSnapshotConfigurationWhenOrientationIsPortraitAndMultitaskingModeIsHalf() throws {
        let variant = SnapshotVariant(orientation: .portrait, multitaskingMode: .half)
        let device = makeiPad()

        assertThrows(try variant.configuration(for: device), UnsupportedSnapshotConfigurationError())
    }

    func testShouldThrowUnsupportedSnapshotConfigurationWhenModelIsiPhoneAndMultitaskingModeIsNotNil() throws {
        let variant = SnapshotVariant(orientation: .portrait, multitaskingMode: .oneThird)
        let device = makeiPhone()

        assertThrows(try variant.configuration(for: device), UnsupportedSnapshotConfigurationError())
    }

    func testBuilderShouldReturnOneVariantGivenOneOrientationOneStyleAndOneLayoutDirection() throws {
        let builder = SnapshotVariant.Builder(orientation: .portrait)
        let variants = builder.build()

        assertThat(variants, hasCount(1))
        assertThat(variants.first?.orientation, equalTo(.portrait))
        assertThat(variants.first?.style, equalTo(.light))
        assertThat(variants.first?.layoutDirection, equalTo(.leftToRight))
    }

    func testBuilderShouldReturnTwoVariantsGivenOneOrientationAndTwoStyles() throws {
        let builder = SnapshotVariant.Builder(orientation: .portrait, style: .light)
        builder.add(style: .dark)

        let variants = builder.build()

        let firstVariant = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight)
        let secondVariant = SnapshotVariant(orientation: .portrait, style: .dark, layoutDirection: .leftToRight)
        assertThat(variants, containsInAnyOrder(firstVariant, secondVariant))
    }

    func testBuilderShouldReturnFourVariantsGivenTwoOrientationsAndTwoStyles() throws {
        let builder = SnapshotVariant.Builder(orientation: .portrait, style: .light)
        builder.add(style: .dark)
        builder.add(orientation: .landscape)

        let variants = builder.build()

        let firstVariant = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight)
        let secondVariant = SnapshotVariant(orientation: .portrait, style: .dark, layoutDirection: .leftToRight)
        let thirdVariant = SnapshotVariant(orientation: .landscape, style: .light, layoutDirection: .leftToRight)
        let fourthVariant = SnapshotVariant(orientation: .landscape, style: .dark, layoutDirection: .leftToRight)
        assertThat(variants, containsInAnyOrder(firstVariant, secondVariant, thirdVariant, fourthVariant))
    }

    func testBuilderShouldReturnOneVariantGivenOneContentSize() {
        let builder = SnapshotVariant.Builder(orientation: .portrait, style: .light, contentSize: .extraSmall)

        let variants = builder.build()

        let firstVariant = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .extraSmall)
        assertThat(variants.first, equalTo(firstVariant))
    }

    func testBuilderShouldReturnTwoVariantGivenTwoContentSizes() {
        let builder = SnapshotVariant.Builder(orientation: .portrait, style: .light, contentSize: .small)
        builder.add(contentSize: .extraSmall)

        let variants = builder.build()

        let firstVariant = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .small)
        let secondVariant = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .extraSmall)
        assertThat(variants, containsInAnyOrder(firstVariant, secondVariant))
    }

    func testBuilderShouldReturnThreeVariantsGivenThreeContentSizes() {
        let builder = SnapshotVariant.Builder(orientation: .portrait, style: .light, contentSize: .large)
        builder.add(contentSizes: [.extraSmall, .extraExtraLarge])

        let variants = builder.build()

        let firstVariant = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .extraSmall)
        let secondVariant = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .extraExtraLarge)
        let thirdVariant = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .large)
        assertThat(variants, hasCount(3))
        assertThat(variants, containsInAnyOrder(firstVariant, secondVariant, thirdVariant))
    }

    func testBuilderShouldReturnTwoVariantsGivenOneContentSizeAndOneMultitaskingModeIncludingFullscreenMultitaskingMode() throws {
        let builder = SnapshotVariant.Builder(orientation: .portrait, style: .light, contentSize: .large)
        builder.add(multitaskingMode: .oneThird)

        let variants = builder.build()

        let firstVariant = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .large, multitaskingMode: nil)
        let secondVariant = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .large, multitaskingMode: .oneThird)
        assertThat(variants, hasCount(2))
        assertThat(variants, containsInAnyOrder(firstVariant, secondVariant))
    }

    func testBuilderShouldReturnThreeVariantsGivenTwoMultitaskingModeIncludingFullscreen() {
        let builder = SnapshotVariant.Builder(orientation: .portrait, style: .light)
        builder.add(multitaskingModes: [.oneThird, .twoThird])

        let variants = builder.build()

        let firstVariant = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .large, multitaskingMode: nil)
        let secondVariant = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .large, multitaskingMode: .oneThird)
        let thirdVariant = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .large, multitaskingMode: .twoThird)
        assertThat(variants, hasCount(3))
        assertThat(variants, containsInAnyOrder(firstVariant, secondVariant, thirdVariant))
    }

    func testDescriptionShouldSerializeAllOptionsToString() {
        let sut = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .extraSmall, multitaskingMode: .oneThird)

        assertThat(sut.description, equalTo("portrait-light-LTR-XS-oneThird"))
    }

    func testDescriptionWithLandscapeOrientationShouldSerializeAllOptionsToString() {
        let sut = SnapshotVariant(orientation: .landscape, style: .light, layoutDirection: .leftToRight, contentSize: .extraSmall, multitaskingMode: .oneThird)

        assertThat(sut.description, equalTo("landscape-light-LTR-XS-oneThird"))
    }

    func testDescriptionWithDarkStyleShouldSerializeOptionsToString() {
        let sut = SnapshotVariant(orientation: .portrait, style: .dark, layoutDirection: .leftToRight, contentSize: .extraSmall, multitaskingMode: .oneThird)

        assertThat(sut.description, equalTo("portrait-dark-LTR-XS-oneThird"))
    }

    func testDescriptionWithRightToLeftDirectionShouldSerializeOptionsToString() {
        let sut = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .rightToLeft, contentSize: .extraSmall, multitaskingMode: .oneThird)

        assertThat(sut.description, equalTo("portrait-light-RTL-XS-oneThird"))
    }

    func testDescriptionWithExtraSmallContentSizeShouldSerializeOptionsToString() {
        let sut = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .extraSmall, multitaskingMode: .oneThird)

        assertThat(sut.description, equalTo("portrait-light-LTR-XS-oneThird"))
    }

    func testDescriptionWithSmallContentSizeShouldSerializeOptionsToString() {
        let sut = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .small, multitaskingMode: .oneThird)

        assertThat(sut.description, equalTo("portrait-light-LTR-S-oneThird"))
    }

    func testDescriptionWithMediumContentSizeShouldSerializeOptionsToString() {
        let sut = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .medium, multitaskingMode: .oneThird)

        assertThat(sut.description, equalTo("portrait-light-LTR-M-oneThird"))
    }

    func testDescriptionWithLargeContentSizeShouldSerializeOptionsToString() {
        let sut = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .large, multitaskingMode: .oneThird)

        assertThat(sut.description, equalTo("portrait-light-LTR-L-oneThird"))
    }

    func testDescriptionWithExtraLargeContentSizeShouldSerializeOptionsToString() {
        let sut = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .extraLarge, multitaskingMode: .oneThird)

        assertThat(sut.description, equalTo("portrait-light-LTR-XL-oneThird"))
    }

    func testDescriptionWithExtraExtraLargeContentSizeShouldSerializeOptionsToString() {
        let sut = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .extraExtraLarge, multitaskingMode: .oneThird)

        assertThat(sut.description, equalTo("portrait-light-LTR-XXL-oneThird"))
    }

    func testDescriptionWithExtraExtraExtraLargeContentSizeShouldSerializeOptionsToString() {
        let sut = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .extraExtraExtraLarge, multitaskingMode: .oneThird)

        assertThat(sut.description, equalTo("portrait-light-LTR-XXXL-oneThird"))
    }

    func testDescriptionWithOneThirdMultitaskingModeShouldSerializeOptionsToString() {
        let sut = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .small, multitaskingMode: .oneThird)

        assertThat(sut.description, equalTo("portrait-light-LTR-S-oneThird"))
    }

    func testDescriptionWithTwoThirdMultitaskingModeShouldSerializeOptionsToString() {
        let sut = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .small, multitaskingMode: .twoThird)

        assertThat(sut.description, equalTo("portrait-light-LTR-S-twoThird"))
    }

    func testDescriptionWithHalfMultitaskingModeShouldSerializeOptionsToString() {
        let sut = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .small, multitaskingMode: .half)

        assertThat(sut.description, equalTo("portrait-light-LTR-S-half"))
    }

    func testDescriptionWithoutMultitaskingModeShouldSerializeOptionsToString() {
        let sut = SnapshotVariant(orientation: .portrait, style: .light, layoutDirection: .leftToRight, contentSize: .small, multitaskingMode: nil)

        assertThat(sut.description, equalTo("portrait-light-LTR-S"))
    }

    func testAllShouldReturnABuilderCreatingAllPossibleVariants() {
        let sut = SnapshotVariant.Builder.all

        let variants = sut.build()

        let expectedCount = Screen.Orientation.allCases.count *
                                Screen.Style.allCases.count *
                                Screen.LayoutDirection.allCases.count *
                                Screen.ContentSize.allCases.count *
                                (Screen.MultitaskingMode.allCases.count + 1)
        assertThat(variants, hasCount(expectedCount))
    }

    func testDefaultShouldReturnABuilderCreatingVariantsForAllOrientationsStyleAndMultitaskingModes() {
        let sut = SnapshotVariant.Builder.default

        let variants = sut.build()

        let expectedCount = Screen.Orientation.allCases.count *
            Screen.Style.allCases.count *
            (Screen.MultitaskingMode.allCases.count + 1)
        assertThat(variants, hasCount(expectedCount))
    }

    // MARK: Helpers

    private func makeiPhone(model: Device.Model = .iPhone8) -> Device {
        Device(model: model)
    }

    private func makeiPad(model: Device.Model = .iPad8thGen) -> Device {
        Device(model: model)
    }
}
