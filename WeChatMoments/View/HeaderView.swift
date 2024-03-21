//
//  HeaderView.swift
//  WeChatMoments
//
//  Created by Tushar Sharma on 09/03/24.
//

import SwiftUI

struct HeaderView: View {
    private let avatarImageWidth: CGFloat = 75
    private let avatarImageHeight: CGFloat = 75

    private let nickNameLabelWidth: CGFloat = 200
    private let nickNameFontSize: CGFloat = 16

    private let headerViewHeight: CGFloat = 370

    @State private var profileImage: Image = Image(Constants.DEFAULT_EMPTY_IMAGE)
    @State private var avatarImage: Image = Image(Constants.DEFAULT_EMPTY_IMAGE)
    @State private var nickname: String = ""

    var user: User?

    var body: some View {
        ZStack {
            GeometryReader { proxy in
                profileImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width,height: headerViewHeight)
                    .clipped()

                HStack(spacing: 20) {
                    Text(nickname)
                        .frame(width: nickNameLabelWidth,alignment: .trailing)
                        .font(.system(size: nickNameFontSize,weight: .bold))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .truncationMode(.middle)
                        .padding(.bottom,15)

                    avatarImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: avatarImageWidth, height: avatarImageHeight)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.white, lineWidth: 2)
                        )
                }.offset(x:avatarImageXOffset(from: proxy),y: avatarImageYOffset())
            }.onAppear {
                if let user = user {
                    setProfileImage(for: user)
                    setNickNameLabel(for: user)
                    setAvatarImage(for: user)
                }
            }
        }.frame(height:headerViewHeight + 28)
    }

    private func avatarImageXOffset(from proxy: GeometryProxy) -> CGFloat {
        let padding: CGFloat = 30
        let avatarImageXAxis: CGFloat = nickNameLabelWidth + avatarImageWidth + padding
        return proxy.size.width - avatarImageXAxis
    }

    private func avatarImageYOffset() -> CGFloat {
        let padding: CGFloat = 50
        return headerViewHeight - padding
    }

    private func setProfileImage(for user: User) {
        if let url = user.profile {
            ImageHelper.shared.getImage(url, forSize: Constants.SENDER_PROFILE_SIZE) { image in
                self.profileImage = Image(uiImage: image!)
            }
        }
    }

    private func setAvatarImage(for user: User) {
        if let url = user.avatar {
            guard let image = ImageHelper.shared.getImage(url, forSize: Constants.SENDER_AVATAR_SIZE) else { return }
            self.avatarImage = Image(uiImage: image)
        }
    }

    private func setNickNameLabel(for user: User) {
        if let nickName = user.nick {
            self.nickname = nickName
        }
    }
}

#Preview {
    HeaderView(user: User(username: "jsmith",
                          nick: "John Smith",
                          avatar: "http://info.thoughtworks.com/rs/thoughtworks2/images/glyph_badge.png",
                          profile: "http://img2.findthebest.com/sites/default/files/688/media/images/Mingle_159902_i0.png")
    )
}
