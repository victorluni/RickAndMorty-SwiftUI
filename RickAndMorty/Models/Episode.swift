//
//  Episode.swift
//  RickAndMorty
//
//  Created by Victor Luni on 09/09/20.
//  Copyright © 2020 Victor Luni. All rights reserved.
//

import Foundation


struct Episode: Codable, Identifiable, Hashable {
    var id: Int
    var name: String
    var air_date: String
    var episode: String
    var characters: [String]
    var url: String
    var created: String
}
