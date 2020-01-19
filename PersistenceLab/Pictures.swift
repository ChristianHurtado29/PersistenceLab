//
//  Pictures.swift
//  PersistenceLab
//
//  Created by Christian Hurtado on 1/19/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import Foundation

class hits: Codable{
    let hits: Pictures
}

class Pictures: Codable{
    let largeImageUrl: String
    let likes: Int
    let view: Int
    let comments: Int
    let tags: [String?]
    let user: String
}
