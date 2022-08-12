// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE for licensing information

import Foundation

public protocol JSONDecodingTrait {

    func decode<T: Decodable>(_ type: T.Type, json: String, userInfo: [CodingUserInfoKey : Any]) throws -> T

    func decode<T: Decodable>(_ type: T.Type, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy, json: String, userInfo: [CodingUserInfoKey : Any]) throws -> T

    func decode<T: Decodable>(_ type: T.Type, decoder: JSONDecoder, json: String) throws -> T
}

public extension JSONDecodingTrait {

    func decode<T: Decodable>(_ type: T.Type, json: String, userInfo: [CodingUserInfoKey : Any] = [:]) throws -> T {
        try decode(type, dateDecodingStrategy: .deferredToDate, json: json, userInfo: userInfo)
    }

    func decode<T: Decodable>(_ type: T.Type, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy, json: String, userInfo: [CodingUserInfoKey : Any] = [:]) throws -> T {
        let decoder = JSONDecoder()
        decoder.userInfo = userInfo
        decoder.dateDecodingStrategy = dateDecodingStrategy
        return try decode(type, decoder: decoder, json: json)
    }

    func decode<T: Decodable>(_ type: T.Type, decoder: JSONDecoder, json: String) throws -> T {
        try decoder.decode(type, from: Data(json.utf8))
    }
}
