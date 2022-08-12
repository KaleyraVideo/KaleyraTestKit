// Copyright © 2022 Kaleyra S.p.a. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation

public protocol JSONDecodingTestCase: JSONDecodingTrait {
    associatedtype SUT where SUT: Decodable

    func decode(_ json: String, userInfo: [CodingUserInfoKey : Any]) throws -> SUT
}

public extension JSONDecodingTestCase {

    func decode(_ json: String, userInfo: [CodingUserInfoKey : Any] = [:]) throws -> SUT {
        try decode(SUT.self, json: json, userInfo: userInfo)
    }
}
