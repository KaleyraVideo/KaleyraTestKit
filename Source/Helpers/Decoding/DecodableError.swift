// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE for licensing information

import Foundation

public struct DecodableError: Error, Decodable, Equatable {

    let message: String

    public init(message: String) {
        self.message = message
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        message = try container.decode(String.self)
    }
}
