//
//  Locality.swift
//  Yiqing
//
//  Created by Bin CHEN on 2/4/20.
//  Copyright © 2020 Fantestech. All rights reserved.
//

import Foundation

struct LocalityList: Codable {
    var newslist: [Locality]
}

struct Locality: Codable {
    var country: String?
    var provinceName: String?
    var provinceShortName: String?
    var city: String?
    var confirmedCount: Int
    var suspectedCount: Int
    var curedCount: Int
    var deadCount: Int
}
