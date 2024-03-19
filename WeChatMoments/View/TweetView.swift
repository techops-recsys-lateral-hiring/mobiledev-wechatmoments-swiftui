//
//  TweetView.swift
//  WeChatMoments
//
//  Created by Wole Solana on 2/28/24.
//

import SwiftUI

struct TweetView: View {
    var tweet: Tweet
    private let imageLimit = 5
    private let gridColumnCount = 3

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                // TODO: Use correct tweet sender avatar
                avatar(_from: nil)
                    .frame(
                        width: Constants.SENDER_AVATAR_SIZE.width,
                        height: Constants.SENDER_AVATAR_SIZE.height)
                    .cornerRadius(5.0)

                // TODO: Assign the correct user name or nickname
                VStack(alignment: .leading) {
                    Text("Placeholder Profile")
                        .font(.system(size: Constants.FONT_SIZE_CONTENT))
                        .foregroundColor(.blue)

                    Text(tweet.content ?? "")
                        .foregroundColor(.black)
                        .font(.system(size: Constants.FONT_SIZE_CONTENT))
                        .lineLimit(nil)
                        .padding(.top, Constants.TWEET_CONTENT_TOP_OFFSET)

                    // TODO: Add tweet image grid to view
                    addImagesToView(_from: [])
                }
                .padding(.leading, Constants.TWEET_SENDER_LEFT_OFFSET)

                Spacer()
            }
            Divider()
        }
        .padding(.all)
    }

    private func avatar(_from avatarURL: Any?) -> Image {
        var avatar = Image(Constants.DEFAULT_EMPTY_IMAGE)
        if let avatarURL = avatarURL as? String {
            ImageHelper.shared.getImage(avatarURL, forSize: Constants.SENDER_AVATAR_SIZE) { image in
                avatar = Image(uiImage: image!)
            }
        }

        return avatar
    }

    private func addImagesToView(_from URLs: [String]?) -> AnyView? {
        guard let imageURLs = URLs else { return nil }
        var images: [Image] = []

        for imageURL in imageURLs {
            guard let image = fetchImage(_from: imageURL) else { return nil }
            images.append(image)
        }


        return LazyVGrid(columns: Array(repeating: GridItem(), count: gridColumnCount),
                         spacing: Constants.TWEET_IMAGE_SEPARATOR_SPACE) {
            ForEach(0..<imageLimit, id: \.self) { index in
                if index < images.count {
                    images[index]
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: Constants.IMAGE_SIZE.width * 2,
                               height: Constants.IMAGE_SIZE.height * 2)
                        .clipped()
                } else {
                    // Placeholder view for empty slots in the grid
                    Image(Constants.DEFAULT_EMPTY_IMAGE)
                }
            }
        }
                         .padding() as? AnyView
    }

    private func fetchImage(_from URL: String) -> Image? {
        var imageToReturn: Image? = nil
        ImageHelper.shared.getImage(URL, forSize: Constants.IMAGE_SIZE) { image in
            imageToReturn = Image(uiImage: image!)
        }

        return imageToReturn
    }

}

#Preview {
    TweetView(tweet: Tweet(content: "Unlike many proprietary big data processing platform different, Spark is built on a unified abstract RDD, making it possible to deal with different ways consistent with large data processing scenarios, including MapReduce, Streaming, SQL, Machine Learning and Graph so on. To understand the Spark, you have to understand the RDD."))
}
