//
//  HeaderView.swift
//  WeChatMoments
//
//  Created by Tushar Sharma on 09/03/24.
//

import SwiftUI

struct HeaderView: View {

    private var avatarImageWidth:CGFloat = 75
    private var avatarImageHeight:CGFloat = 75

    private var nickNameLabelWidth:CGFloat = 200
    private var nickNameFontSize:CGFloat = 16

    private var headerViewHeight:CGFloat = 370

    @State private var profileImage:Image = Image(Constants.DEFAULT_EMPTY_IMAGE)
    @State private var avatarImage:Image = Image(Constants.DEFAULT_EMPTY_IMAGE)
    @State private var nickname:String = ""

    var body: some View {
        VStack{
            GeometryReader{ outerView in
                ZStack{
                    GeometryReader{ innerView in
                        profileImage
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: innerView.size.width,height: headerViewHeight)
                            .clipped()
                        HStack(spacing:20){
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
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .border(.white, width: 2)
                        }.offset(x:avatarImageXOffset(from: innerView),y: avatarImageYOffset())
                    }
                }.frame(width: outerView.size.width,height: headerViewHeight)
            }
        }
        Spacer()
    }

    private func avatarImageXOffset(from proxy:GeometryProxy) -> CGFloat{
        let padding:CGFloat = 30
        let avatarImageXAxis:CGFloat = nickNameLabelWidth + avatarImageWidth + padding
        return proxy.size.width - avatarImageXAxis
    }

    private func avatarImageYOffset() -> CGFloat{
        let padding:CGFloat = 50
        return headerViewHeight - padding
    }

    //TODO: Call after receiving User object
    private func setProfileImage(for user:User){
        if let url = user.profile {
            ImageHelper.shared.getImage(url, forSize: Constants.SENDER_PROFILE_SIZE) { image in
                self.profileImage = Image(uiImage: image!)
            }
        }
    }

    //TODO: Call after receiving User object
    private func setAvatarImage(for user:User){
        if let url = user.avatar {
            ImageHelper.shared.getImage(url, forSize: Constants.SENDER_AVATAR_SIZE){ image in
                self.avatarImage = Image(uiImage: image!)
            }
        }
    }

    //TODO: Call after receiving User object
    private func setNickNameLabel(for user:User){
        if let nickName = user.nick {
            self.nickname = nickName
        }
    }
}

#Preview {
    HeaderView()
}
