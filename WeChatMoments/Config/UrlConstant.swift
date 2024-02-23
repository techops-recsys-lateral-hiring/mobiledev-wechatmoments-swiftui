//
//  UrlConstant.swift
//  WeChatMoments
//
//  Created by nontapat.siengsanor on 23/2/24.
//

import UIKit

enum UrlConstant {
    private static let HOST = "http://localhost:2727"

    static func userProfleUrl(name: String) -> String {
        return "\(UrlConstant.HOST)/user/\(name)"
    }

    static func tweetsUrl(name: String) -> String {
        return "\(UrlConstant.HOST)/user/\(name)/tweets"
    }
}
