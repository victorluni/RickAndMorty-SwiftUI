//
//  EpisodesViewModel.swift
//  RickAndMorty
//
//  Created by Victor Luni on 09/09/20.
//  Copyright © 2020 Victor Luni. All rights reserved.
//

import Foundation

class EpisodeViewModel: ObservableObject, Identifiable {
    @Published private var model: Episode = Episode(id: 0, name: "", air_date: "", episode: "", characters: [], url: "", created: "")
    
    @Published private var characterList: [Character] = []
    
    private var episode: Episode?
    
    var name: String {
        model.name
    }
    
    var airDate: String {
        model.air_date
    }
    
    var characters: [Character] {
        characterList
    }
    
    var episodeNumber: String {
        model.episode
    }
    

    init(with episode: Episode) {
        self.model = episode
        self.retrieveCharacters()
    }
    
    
    func retrieveCharacters() {
        var temp: [Character] = []
        let suffix = self.splitCharacterURL(urls: model.characters)
       let base =  "https://rickandmortyapi.com/api/character/\(suffix)"
        ApiManager<[Character]>().getDataGenerics(from: base) { (chars) in
            temp = chars
            self.bindCharactersOutput(responseFromApi: temp)
        }
    }
    
    private func bindCharactersOutput(responseFromApi: [Character]) {
        DispatchQueue.main.async {
            self.characterList = responseFromApi
        }
    }
    
    private func splitCharacterURL(urls: [String]) -> String {
        let delimiter = "https://rickandmortyapi.com/api/character/"
        var characterArray: [String] = []
        for u in urls {
            var element = u.components(separatedBy: delimiter)[1]
            characterArray.append(element)
        }
        return characterArray.joined(separator: ",")
    }
}

