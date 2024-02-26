//
//  MyModels.swift
//  WeChatMoments
//
//  Created by nontapat.siengsanor on 23/2/24.
//

struct Comment: Decodable {
    let content: String?
    let sender: User?
}

struct User: Decodable {
    let username: String?
    let nick: String?
    let avatar: String?
    let profile: String?
}

struct Img: Decodable {
    let url: String
}

struct Tweet: Decodable {
    let content: String?
}

