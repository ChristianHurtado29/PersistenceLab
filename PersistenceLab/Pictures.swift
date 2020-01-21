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
    let largeImageURL: String
    let likes: Int
    let views: Int
    let comments: Int
    let downloads: Int
    let user: String
    let previewURL: String
}
