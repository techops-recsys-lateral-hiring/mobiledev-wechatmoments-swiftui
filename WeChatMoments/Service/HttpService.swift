//
//  HttpService.swift
//  WeChatMoments
//
//  Created by nontapat.siengsanor on 23/2/24.
//

import Combine
import Foundation

protocol BaseService {
    func get(url: URL) -> AnyPublisher<Data, URLError>
}

class HttpService: BaseService {
    private let urlSession: URLSession

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    func get(url: URL) -> AnyPublisher<Data, URLError> {
        return urlSession
            .dataTaskPublisher(for: url)
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
