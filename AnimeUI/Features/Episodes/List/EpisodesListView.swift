//
//  EpisodeListView.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 09/03/2021.
//

import SwiftUI

struct EpisodesListView: View {
  @StateObject private var data: EpisodesListViewModel
  
  init(_ anime: Anime) {
    _data = StateObject(wrappedValue: EpisodesListViewModel(anime))
  }
  
  var body: some View {
    List {
      ForEach(data.episodeDetails ?? Array(repeating: EpisodeRowDetail.placeHolder(),
                                           count: 10), id: \.id) { episode in
        NavigationLink(
          destination: EpisodeDetailView(episode, data.title ?? "N/A"),
          label: {
            EpisodesListRowView(episode: episode)
          })
      }
      if data.shouldDisplayNextPage {
        nextPageView
      }
    }
    .navigationTitle("Episodes")
    .onAppear {
      data.fetchEpisodes()
    }
  }
  
  private var nextPageView: some View {
    HStack {
      Spacer()
      VStack {
        ProgressView()
        Text("Loading next page...")
      }
      Spacer()
    }
    .onAppear(perform: {
      data.currentPage += 1
    })
  }
}
