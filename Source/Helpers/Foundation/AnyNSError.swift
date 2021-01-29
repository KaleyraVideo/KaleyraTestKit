// Copyright © 2021 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation

public func anyNSError() -> NSError {
    NSError(domain: "generic error", code: 0)
}
