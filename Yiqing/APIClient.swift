//
//  APIClient.swift
//  Yiqing
//
//  Created by Bin CHEN on 2/4/20.
//  Copyright © 2020 Fantestech. All rights reserved.
//

import Foundation

class APIClient {
    static let endPoint = "http://api.tianapi.com/txapi/ncovcity/index?key=37b705c154183f853e0ef18f9073a277"
    
    static let shared = APIClient()
    
    func request(_ completion: @escaping ([Locality]) -> Void ) {
        URLSession.shared.dataTask(with: URL(string: APIClient.endPoint)!) { (data, response, error) in
            if let d = data {
                let jsonDecoder = JSONDecoder()
                let localityList = try! jsonDecoder.decode(LocalityList.self, from: d)
                completion(localityList.newslist)
            } else {
                completion([])
            }
        }.resume()
    }
}
