//
//  HttpService.swift
//  WeChatMoments
//
//  Created by nontapat.siengsanor on 23/2/24.
//

import Alamofire
import PromiseKit
import SwiftyJSON

protocol BaseService {
    func get(url: String) -> Promise<Data>
}

class HttpService: BaseService {
    func get(url: String) -> Promise<Data> {
        return Promise { resolve in
            AF.request(url).responseData(completionHandler: { response in
                switch response.result {
                case .success(let data):
                    resolve.resolve(data, nil)
                case .failure(let error):
                    resolve.reject(error)
                }
            })
        }
    }
}
