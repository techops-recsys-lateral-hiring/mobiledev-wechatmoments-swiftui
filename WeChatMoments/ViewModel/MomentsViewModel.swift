//
//  MomentsViewModel.swift
//  WeChatMoments
//
//  Created by Tushar Sharma on 19/03/24.
//

import Foundation
import Combine

class MomentsViewModel:ObservableObject{

    private let tweetService = TweetService()
    var cancellable = Set<AnyCancellable>()

    @Published var showIndicator = false
    @Published var tweets:[Tweet]?

    func loadData() {
        showIndicator.toggle()
        loadTweets()
    }

    private func loadTweets(){
        self.tweetService.getTweets(Constants.USER_NAME)
            .receive(on:RunLoop.main)
            .sink { completion in
                self.showIndicator.toggle()
                switch completion{
                case .finished:
                    print("Tweets Loaded")
                case let .failure(error):
                    print(error)
                }
            } receiveValue: { tweets in
                self.tweets = tweets.filter{$0.content != nil}
            }.store(in: &cancellable)
    }
}
