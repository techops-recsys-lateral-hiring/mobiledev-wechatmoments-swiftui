//
//  UrlConstant.swift
//  WeChatMoments
//
//  Created by nontapat.siengsanor on 23/2/24.
//

import UIKit

enum UrlConstant {
    private static let hostUrl = URL(string: "http://localhost:2727")!

    static func userProfleUrl(name: String) -> URL {
        return hostUrl.appending(path: "/user/\(name)")
    }

    static func tweetsUrl(name: String) -> URL {
        return hostUrl.appending(path: "/user/\(name)/tweets")
    }
}
