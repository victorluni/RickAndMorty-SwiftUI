//
//  EpisodeListViewModel.swift
//  RickAndMorty
//
//  Created by Victor Luni on 09/09/20.
//  Copyright © 2020 Victor Luni. All rights reserved.
//

import Foundation

class EpisodeListViewModel: ObservableObject {
    @Published private var episodeList: [Episode] = []
    
    var episodes: [Episode] {
        episodeList
    }
    
    init() {
        retrieveEpisodes()
    }
    
    func retrieveEpisodes() {
        var temp: [Episode] = []
        ApiManager<EpisodeList>().getDataGenerics(from: "https://rickandmortyapi.com/api/episode/") { (list) in
            temp = list.episodes
            
            ApiManager<EpisodeList>().getDataGenerics(from: list.info.next) { (result) in
                temp.append(contentsOf: result.episodes)
                self.bindEpisodesOutput(retrievedEpisodes: temp)
            }
        }
    }
    
    func bindEpisodesOutput(retrievedEpisodes: [Episode]) {
        DispatchQueue.main.async {
            self.episodeList = retrievedEpisodes
        }
    }
}
