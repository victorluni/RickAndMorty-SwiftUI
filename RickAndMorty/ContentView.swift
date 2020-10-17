//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Victor Luni on 09/09/20.
//  Copyright © 2020 Victor Luni. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   // @ObservedObject var episode: EpisodeViewModel
    @ObservedObject var episodeList: EpisodeListViewModel
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical) {
                VStack(spacing: 200) {
                    ForEach(episodeList.episodes, id: \.self) { ep in
                            EpisodeBox(episode: ep)
                    }
                }.frame(maxWidth: .infinity).padding([.bottom], 200)
            }.navigationTitle("Episódios")
        }
    }
}

struct EpisodeBox: View {
    var episode: Episode
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white).opacity(0.3)
                .frame(width: size.width, height: 200)
                //.background((Image("BannerBackground").resizable().blur(radius: 5)))
            VStack {
                Text(episode.episode)
                Text(episode.name)
                Text(episode.air_date)
                NavigationLink(destination: EpisodeDetail(episode: EpisodeViewModel(with: episode))) {
                    Text("See More")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(episodeList: EpisodeListViewModel())
    }
}
