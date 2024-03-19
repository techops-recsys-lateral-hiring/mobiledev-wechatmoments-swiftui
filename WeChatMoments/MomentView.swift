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
        return ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .controlSize(.large)
    }

    private var tweets:[Tweet]{
        momentsViewModel.tweets ?? []
    }

    var body: some View {
            List{
                Group{
                    HeaderView().ignoresSafeArea(.all)
                    ForEach(0..<tweets.count,id: \.self) { index in
                        TweetView(tweet: tweets[index])
                    } 
                    .listRowSeparator(.hidden)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(PlainListStyle())
            .overlay(content: {
                if momentsViewModel.showIndicator{
                    indicatorView
                }
             })
            .onAppear{
                momentsViewModel.loadData()
         }
     }
}

#Preview {
    MomentView()
}
