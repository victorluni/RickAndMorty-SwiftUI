//
//  Links.swift
//  RickAndMorty
//
//  Created by Victor Luni on 09/09/20.
//  Copyright © 2020 Victor Luni. All rights reserved.
//

import Foundation


struct Endpoints {
    var endpoint: [String: String]
    
    
    func getEndpoints() {
        let baseURL = "https://rickandmortyapi.com/api/"

    }
}


class ApiManager<DataContent> where DataContent: Decodable {
    
    
    func getDataGenerics(from: String, completion: @escaping (DataContent) -> ()) {
        if let url = URL(string: from) {
            URLSession.shared.dataTask(with: url) { data, res, err in
                if let response = data {
                    guard let unwrapped = self.decodeGeneric(data: response) else {
                        fatalError()
                    }
                    completion(unwrapped)
                }
            }.resume()
        }
    }
    
    func decodeGeneric(data: Data) -> DataContent? {
        do {
            let result = try JSONDecoder().decode(DataContent.self, from: data)
            return result
        } catch {
            print(error)
        }
        return nil
    }
    
}
