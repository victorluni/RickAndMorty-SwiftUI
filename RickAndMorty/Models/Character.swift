//
//  Character.swift
//  RickAndMorty
//
//  Created by Victor Luni on 14/09/20.
//  Copyright © 2020 Victor Luni. All rights reserved.
//

import Foundation


struct Character: Codable, Identifiable, Hashable {
    
    
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Origin
    var image: String
    var episode: [String]
    var url: String
    var created: String
    
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.id == rhs.id
    }
    
}

struct Origin: Codable, Hashable {
    var name: String
    var url: String
}
