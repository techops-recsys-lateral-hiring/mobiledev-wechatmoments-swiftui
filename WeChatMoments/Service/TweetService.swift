//
//  TweetService.swift
//  WeChatMoments
//
//  Created by nontapat.siengsanor on 23/2/24.
//

import PromiseKit

class TweetService {
    private var httpService: BaseService

    init() {
        self.httpService = HttpService()
    }

    func getTweets(_ userName: String) -> Promise<[Tweet]> {
        let url = UrlConstant.tweetsUrl(name: userName)
        return httpService.get(url: url).map { data in
            let tweets: [Tweet] = try JSONDecoder().decode([Tweet].self, from: data)
            return tweets
        }
    }
}
