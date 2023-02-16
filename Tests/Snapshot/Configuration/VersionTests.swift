// Copyright © 2018-2021 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

import XCTest
#if canImport(Hamcrest)
import Hamcrest
#elseif canImport(SwiftHamcrest)
import SwiftHamcrest
#endif
import BandyerTestKit

class VersionTests: UnitTestCase {

    func testVersionCompareDifferentMajor() {
        let lower = Version(major: 14, minor: 0)
        let upper = Version(major: 15, minor: 0)

        assertThat(lower, lessThan(upper))
        assertThat(upper, not(lessThan(lower)))
    }

    func testVersionCompareLowerValueWithMinorGreaterThanUpperValue() {
        let lower = Version(major: 10, minor: 3)
        let upper = Version(major: 15, minor: 0)

        assertThat(lower, lessThan(upper))
        assertThat(upper, not(lessThan(lower)))
    }

    func testVersionCompareSameMajorDifferentMinor() {
        let lower = Version(major: 14, minor: 1)
        let upper = Version(major: 14, minor: 2)

        assertThat(upper, greaterThan(lower))
        assertThat(lower, not(greaterThan(upper)))
    }

    func testVersionCompareSameVersion() {
        let lower = Version(major: 14, minor: 1)
        let upper = Version(major: 14, minor: 1)

        assertThat(lower, not(lessThan(upper)))
        assertThat(upper, not(lessThan(upper)))
        assertThat(lower, equalTo(upper))
    }

    func testFromOperatingSystemVersion() {
        let operatingSystemVersion = OperatingSystemVersion(15, 0, 0)
        let version = Version(osVersion: operatingSystemVersion)

        assertThat(version, equalTo(Version(major: 15, minor: 0)))
    }

    func testCreatesVersionFromStringWhenStringContainsMajorAndMinor() {
        let string = "14.4"
        let version = Version(string)

        assertThat(version, present())
        assertThat(version?.major, equalTo(14))
        assertThat(version?.minor, equalTo(4))
    }

    func testCreatesVersionFromStringWhenStringContainsMajorOnly() {
        let string = "14"
        let version = Version(string)

        assertThat(version, present())
        assertThat(version?.major, equalTo(14))
        assertThat(version?.minor, equalTo(0))
    }

    func testCreatesVersionFromStringWhenStringContainsMajorMinorAndPatch() {
        let string = "14.4.1"
        let version = Version(string)

        assertThat(version, present())
        assertThat(version?.major, equalTo(14))
        assertThat(version?.minor, equalTo(4))
    }

    func testReturnsNilWhenStringDoesNotContainAnyVersionInformation() {
        let string = "foo"
        let version = Version(string)

        assertThat(version, nilValue())
    }

    func testReturnsNilWhenStringContainsTwoWordsSeparatedByADot() {
        let string = "foo.bar"
        let version = Version(string)

        assertThat(version, nilValue())
    }

    func testReturnsNilWhenStringContainsOneNumberAndNotANumber() {
        let string = "14.foo"
        let version = Version(string)

        assertThat(version, nilValue())
    }

    func testReturnsNilWhenStringContainsOneWordAndOneNumber() {
        let string = "foo.14"
        let version = Version(string)

        assertThat(version, nilValue())
    }

    func testReturnsNilWhenStringIsNil() {
        let version = Version("")

        assertThat(version, nilValue())
    }
}
