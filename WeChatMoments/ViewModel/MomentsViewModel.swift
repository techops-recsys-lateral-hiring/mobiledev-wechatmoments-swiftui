//
//  MomentsViewModel.swift
//  WeChatMoments
//
//  Created by Tushar Sharma on 19/03/24.
//

import Foundation
import Combine

class MomentsViewModel: ObservableObject {

    private let tweetService = TweetService()
    private let userService = UserService()
    var cancellable = Set<AnyCancellable>()

    @Published var showIndicator = false
    @Published var tweets: [Tweet]?
    @Published var user: User?

    func loadData() {
        showIndicator.toggle()
        loadUserProfile()
        loadTweets()
        showIndicator.toggle()
    }

    private func loadTweets() {
        tweetService.getTweets(Constants.USER_NAME)
            .receive(on: RunLoop.main)
            .sink { completion in
                self.completionHandler(completion, message: "Tweets Loaded")
            } receiveValue: { tweets in
                self.tweets = tweets.filter{ $0.content != nil }
            }.store(in: &cancellable)
    }

    private func loadUserProfile() {
        userService.getUserProfile(Constants.USER_NAME)
            .receive(on: RunLoop.main)
            .sink { completion in
                self.completionHandler(completion, message: "User Loaded")
            } receiveValue: { user in
                self.user = user
            }.store(in: &cancellable)
    }

    fileprivate func completionHandler(_ completion: Subscribers.Completion<any Error>, message: String) {
        showIndicator.toggle()
        switch completion {
            case .finished:
                print(message)
            case let .failure(error):
                print(error)
        }
    }
}
