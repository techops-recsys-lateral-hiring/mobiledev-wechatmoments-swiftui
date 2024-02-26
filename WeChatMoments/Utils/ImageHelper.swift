//
//  ImageHelper.swift
//  WeChatMoments
//
//  Created by nontapat.siengsanor on 23/2/24.
//

import UIKit

class ImageHelper {
    static let shared = ImageHelper()

    func getImage(_ url: String, forSize size: CGSize = .zero) -> UIImage? {
        return nil
    }

    func getImage(_ url: String, forSize size: CGSize = .zero, success: @escaping (_ image: UIImage?) -> Void) {
        if let url = URL(string: url),
           let data = try? Data(contentsOf: url),
           let image = UIImage(data: data)
        {
            success(image)
        }
    }
}
