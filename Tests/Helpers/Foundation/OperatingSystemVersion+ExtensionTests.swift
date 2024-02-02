// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import XCTest
import SwiftHamcrest
import KaleyraTestKit
import KaleyraTestHelpers

final class OperatingSystemVersion_ExtensionTests: UnitTestCase {

    func testCreatesVersionFromInteger() {
        let sut = OperatingSystemVersion(11)
        
        assertThat(sut.majorVersion, equalTo(11))
        assertThat(sut.minorVersion, equalTo(0))
        assertThat(sut.patchVersion, equalTo(0))
    }
    
    func testCreatesVersionFromIntegers() {
        let sut = OperatingSystemVersion(11, 1, 4)
        
        assertThat(sut.majorVersion, equalTo(11))
        assertThat(sut.minorVersion, equalTo(1))
        assertThat(sut.patchVersion, equalTo(4))
    }
    
    func testDescribesVersionInShortFormatWhenPatchIsZero() {
        let sut = OperatingSystemVersion(majorVersion: 13, minorVersion: 2, patchVersion: 0)
        
        assertThat(sut.description, equalTo("13.2"))
    }
    
    func testDescribesVersionInLongFormatWhenPatchIsNotZero() {
        let sut = OperatingSystemVersion(majorVersion: 13, minorVersion: 0, patchVersion: 3)
        
        assertThat(sut.description, equalTo("13.0.3"))
    }
}
