// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE for licensing information

import Foundation

public class URLHelper {

    enum URLError: Error {
        case invalidURL(String)
        case invalidResourceURL(String)
    }

    public static func makeURL(_ string: String) throws -> URL {
        guard let url = URL(string: string) else {
            throw URLError.invalidURL(string)
        }
        return url
    }

    public static func makeResourceURL(_ resource: String, ext: String, bundle: Bundle) throws -> URL {
        guard let url = bundle.url(forResource: resource, withExtension: ext) else {
            throw URLError.invalidResourceURL(resource)
        }
        return url
    }
}
