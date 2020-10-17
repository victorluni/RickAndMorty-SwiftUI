//
//  EpisodeDetail.swift
//  RickAndMorty
//
//  Created by Victor Luni on 10/09/20.
//  Copyright © 2020 Victor Luni. All rights reserved.
//

import SwiftUI
import Combine

struct EpisodeDetail: View {
    @ObservedObject var episode: EpisodeViewModel
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text(episode.name)
                Text(episode.airDate)
                Text(episode.episodeNumber)
                ScrollView (.horizontal) {
                    HStack (spacing: 30){
                        ForEach(episode.characters, id: \.self) { ep in
                            VStack {
                                ImageView(withURL: ep.image)
                                Text(ep.name)
                            }
                        }
                    }
                }.frame(height: 200, alignment: .center).padding([.leading, .trailing], 20)
            }
        }
    }
}

//struct EpisodeDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodeDetail(episode: EpisodeViewModel(with: Epi))
//    }
//}
