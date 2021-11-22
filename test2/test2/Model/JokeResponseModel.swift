//
//  JokeResponseModel.swift
//  test2
//
//  Created by a.akhmadiev on 22.11.2021.
//

import Foundation

struct JokeResponseModel: Decodable {
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
    let accessibility: Double
}
