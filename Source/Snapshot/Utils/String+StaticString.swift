// Copyright © 2021 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation

extension String {

    init(_ staticString: StaticString) {
        self = staticString.withUTF8Buffer {
            String(decoding: $0, as: UTF8.self)
        }
    }
}
