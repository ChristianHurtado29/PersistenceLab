//
//  Pictures.swift
//  PersistenceLab
//
//  Created by Christian Hurtado on 1/19/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import Foundation

struct PicHits: Codable{
    let hits: [Pictures]
}

struct Pictures: Codable{
    let largeImageUrl: String
    let likes: Int
    let view: Int
    let comments: Int
    let tags: [String?]
    let downloads: Int
    let user: String
    let previewURL: String
}
