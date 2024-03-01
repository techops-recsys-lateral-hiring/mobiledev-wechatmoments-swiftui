//
//  TweetView.swift
//  WeChatMoments
//
//  Created by Wole Solana on 2/28/24.
//

import SwiftUI

struct TweetView: View {
    var tweet: Tweet

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                avatar(_from: nil)
                    .frame(
                        width: Constants.SENDER_AVATAR_SIZE.width,
                        height: Constants.SENDER_AVATAR_SIZE.height)
                    .cornerRadius(5.0)

                Text("Placeholder Profile")
                    .font(.system(size: Constants.FONT_SIZE_CONTENT))
                    .foregroundColor(.blue)
                    .padding(.leading, Constants.TWEET_SENDER_LEFT_OFFSET)
                    .frame(maxWidth: 100)
            }
        }
        Text(tweet.content ?? "")
            .foregroundColor(.black)
            .font(.system(size: Constants.FONT_SIZE_CONTENT))
            .lineLimit(nil)
    }

    private func avatar(_from avatarURL: Any?) -> Image {
        var avatar = Image(systemName: "person.crop.square.badge.camera")
        if let avatarURL = avatarURL as? String {
            ImageHelper.shared.getImage(avatarURL, forSize: Constants.SENDER_AVATAR_SIZE) { image in
                avatar = Image(uiImage: image!)
            }
        }

        return avatar
    }

}

#Preview {
    TweetView(tweet: Tweet(content: "This is a test tweet"))
}
