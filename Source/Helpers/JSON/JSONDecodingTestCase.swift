// Copyright © 2022 Kaleyra S.p.a. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation

public protocol JSONDecodingTestCase: JSONDecodingTrait {
    associatedtype SUT where SUT: Decodable

    func decode(_ json: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy) throws -> SUT
    func decode(_ json: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy, userInfo: [CodingUserInfoKey : Any]) throws -> SUT
}

public extension JSONDecodingTestCase {

    func decode(_ json: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate) throws -> SUT {
        try decode(SUT.self, dateDecodingStrategy: dateDecodingStrategy, json: json)
    }

    func decode(_ json: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, userInfo: [CodingUserInfoKey : Any] = [:]) throws -> SUT {
        try decode(SUT.self, dateDecodingStrategy: dateDecodingStrategy, json: json, userInfo: userInfo)
    }
}
