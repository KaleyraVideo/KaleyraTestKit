// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE for licensing information

import Foundation
import Hamcrest

public func equalToLocalizedString(_ key: String, bundle: Bundle, table: String? = "Localizable") -> Matcher<String> {
    let f = equalTo(NSLocalizedString(key, tableName: table, bundle: bundle, comment: ""))
    let s = not(equalTo(key))
    return allOf(f, s)
}
