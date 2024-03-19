//
//  MomentView.swift
//  WeChatMoments
//
//  Created by Tushar Sharma on 22/02/24.
//

import SwiftUI

struct MomentView: View {
    @ObservedObject var momentsViewModel = MomentsViewModel()

    private var indicatorView:some View{
        return ProgressView().progressViewStyle(CircularProgressViewStyle())
    }

    private var tweets:[Tweet]{
        momentsViewModel.tweets ?? []
    }

    private var tweetList:some View{
        List{
            ForEach(0..<tweets.count,id: \.self) { index in
                TweetView(tweet: tweets[index])
            }
        }.listStyle(.plain)
    }

    var body: some View {
        VStack {
            if momentsViewModel.showIndicator{
                indicatorView
            }
            HeaderView()
            tweetList
            FooterView()
        }
        .onAppear{
            momentsViewModel.loadData()
        }
    }
}

#Preview {
    MomentView()
}
