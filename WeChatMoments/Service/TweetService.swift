//
//  TweetService.swift
//  WeChatMoments
//
//  Created by nontapat.siengsanor on 23/2/24.
//

import Combine
import Foundation

class TweetService {
    private var httpService: BaseService

    init() {
        self.httpService = HttpService()
    }

    func getTweets(_ userName: String) -> AnyPublisher<[Tweet], Error> {
        let url = UrlConstant.tweetsUrl(name: userName)

        return httpService
            .get(url: url)
            .decode(type: [Tweet].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
