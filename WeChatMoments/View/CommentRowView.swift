//
//  CommentView.swift
//  WeChatMoments
//
//  Created by Wole Solana on 2/27/24.
//

import SwiftUI

struct CommentRowView: View {
    var comment: Comment
    var body: some View {
        HStack{
            Button {

            } label: {
                Text(displayName(for: comment.sender))
                    .padding(.leading, Constants.SENDER_AVATAR_SIZE.width + 20)
                    .foregroundColor(.blue)
                    .font(.system(size: Constants.FONT_SIZE_COMMENT))
                    .background(Color.commentsBackgroudColor)
            }

            Text(":\(self.comment.content ?? "")")
                .font(.system(size: Constants.FONT_SIZE_COMMENT))
                .background(Color.commentsBackgroudColor)
                .foregroundColor(.black)
                .lineLimit(nil)
                .padding(.trailing, 20)
        }
    }

    private func displayName(for sender: User?) -> String {
        var displayName = sender?.username
        if let nick = sender?.nick {
            displayName = nick
        }
        return displayName ?? "Unknown"
    }

    private func getComment(senderName: String, comment: String) -> NSAttributedString {
        let msg = "\(senderName):\(self.comment.content ?? "")"
        let range = (msg as NSString).range(of: senderName)
        let attrString = NSMutableAttributedString(string: msg)
        attrString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue], range: range)

        return attrString
    }
}

#Preview {
    CommentRowView(
        comment: Comment(
            content: "Some Comment",
            sender: User(
                username: "test user",
                nick: nil,
                avatar: nil,
                profile: nil
            )
        )
    )
}
