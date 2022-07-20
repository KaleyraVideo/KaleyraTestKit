// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE for licensing information

import Foundation
import Hamcrest

@discardableResult
public func assertThatCGFloat(_ actualValue: CGFloat,
                              closeTo expectedValue: Double,
                              delta: Double = 0.001,
                              file: StaticString = #filePath,
                              line: UInt = #line) -> String {
#if swift(>=5.5)
    return Hamcrest.assertThat(actualValue, closeTo(expectedValue, 0.001), file: file, line: line)
#else
    return Hamcrest.assertThat(Double(actualValue), closeTo(expectedValue, 0.001), file: file, line: line)
#endif
}
