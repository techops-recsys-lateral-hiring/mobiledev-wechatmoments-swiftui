//
//  MomentView.swift
//  WeChatMoments
//
//  Created by Tushar Sharma on 22/02/24.
//

import SwiftUI

struct MomentView: View {
    @ObservedObject var momentsViewModel = MomentsViewModel()

    private var indicatorView:some View {
        return ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .controlSize(.large)
    }

    private var tweets:[Tweet] {
        return momentsViewModel.tweets?.compactMap{ $0 } ?? []
    }

    var body: some View {
        List {
            Group {
                HeaderView()
                ForEach(tweets, id: \.self) { tweet in
                    TweetView(tweet: tweet)
                    Divider()
                }
                .listRowSeparator(.hidden)
            }
            .listRowInsets(EdgeInsets())
        }
        .listStyle(PlainListStyle())
        .overlay(content: {
            if momentsViewModel.showIndicator {
                indicatorView
            }
        })
        .onAppear {
            momentsViewModel.loadData()
        }.ignoresSafeArea()
    }
}

#Preview {
    MomentView()
}
