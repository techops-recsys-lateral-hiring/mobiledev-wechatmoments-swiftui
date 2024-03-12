//
//  FooterView.swift
//  WeChatMoments
//
//  Created by Wole Solana on 3/12/24.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack {
            GeometryReader { geometry in
                Color.commentsBackgroudColor
                    .frame(height: 0.5)
                    .offset(y: -0.5)
                    .frame(width: geometry.size.width)
            }
        }
    }
}

#Preview {
    FooterView()
}
