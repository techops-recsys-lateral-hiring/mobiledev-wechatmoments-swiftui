//
//  UserService.swift
//  WeChatMoments
//
//  Created by nontapat.siengsanor on 23/2/24.
//

import Combine
import Foundation

class UserService {
    private var httpService: BaseService

    init() {
        self.httpService = HttpService()
    }

    func getUserProfile(_ name: String) -> AnyPublisher<User, Error> {
        let url = UrlConstant.userProfleUrl(name: name)

        return httpService
            .get(url: url)
            .decode(type: User.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
