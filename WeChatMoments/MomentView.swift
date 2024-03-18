//
//  MomentView.swift
//  WeChatMoments
//
//  Created by Tushar Sharma on 22/02/24.
//

import SwiftUI

struct MomentView: View {
    var body: some View {
        VStack {
            HeaderView()
            TweetView(tweet: Tweet(content: "This is a tweet"))
            FooterView()
        }
    }
}

#Preview {
    MomentView()
}
