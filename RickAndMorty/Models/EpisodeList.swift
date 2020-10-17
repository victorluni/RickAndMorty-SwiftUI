//
//  EpisodeList.swift
//  RickAndMorty
//
//  Created by Victor Luni on 09/09/20.
//  Copyright © 2020 Victor Luni. All rights reserved.
//

import Foundation

struct EpisodeList: Codable {
    
    var info: Info
    var episodes: [Episode]
    
    enum CodingKeys: String, CodingKey {
        case info = "info"
        case episodes = "results"
    }
}

struct Info: Codable {
    var count: Int
    var pages: Int
    var next: String
    var prev: String?
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case pages = "pages"
        case next = "next"
        case prev = "prev"
    }
}
