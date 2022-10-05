// Copyright © 2022 Kaleyra S.p.a. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation

@available(iOS 11.0, *)
public protocol JSONEncodingTrait {

    func encode<T: Encodable>(_ value: T) throws -> String

    func encode<T: Encodable>(_ value: T, outputFormatting: JSONEncoder.OutputFormatting) throws -> String

    func encode<T: Encodable>(_ value: T, encoder: JSONEncoder) throws -> String

    static func encode<T: Encodable>(_ value: T) throws -> String

    static func encode<T: Encodable>(_ value: T, outputFormatting: JSONEncoder.OutputFormatting) throws -> String

    static func encode<T: Encodable>(_ value: T, encoder: JSONEncoder) throws -> String
}

@available(iOS 11.0, *)
public extension JSONEncodingTrait {

    func encode<T: Encodable>(_ value: T) throws -> String {
        try Self.encode(value)
    }

    func encode<T: Encodable>(_ value: T, outputFormatting: JSONEncoder.OutputFormatting) throws -> String {
        try Self.encode(value, outputFormatting: outputFormatting)
    }

    func encode<T: Encodable>(_ value: T, encoder: JSONEncoder) throws -> String {
        try Self.encode(value, encoder: encoder)
    }

    static func encode<T: Encodable>(_ value: T) throws -> String {
        try Self.encode(value, outputFormatting: [.prettyPrinted, .sortedKeys])
    }

    static func encode<T: Encodable>(_ value: T, outputFormatting: JSONEncoder.OutputFormatting) throws -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = outputFormatting
        return try Self.encode(value, encoder: encoder)
    }

    static func encode<T: Encodable>(_ value: T, encoder: JSONEncoder) throws -> String {
        let data = try encoder.encode(value)
        return String(data: data, encoding: .utf8)!
    }
}
