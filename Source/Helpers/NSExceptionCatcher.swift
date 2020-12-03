// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation

extension NSException : Error
{
    public var _domain: String { return "com.bandyer" }
    public var _code: Int { return 0 }
}

public func tryCatchObjcException(_ block: (() -> Void)) throws {
    var exception: NSException?

    tryAndCatch(block) { objcException in
        exception = objcException
    }

    if let throwable = exception {
        throw throwable
    }
}
