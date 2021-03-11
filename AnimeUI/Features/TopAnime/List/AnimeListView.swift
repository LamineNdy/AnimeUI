//
//  AnimeListView.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 07/03/2021.
//

import SwiftUI

struct AnimeListView: View {
  @StateObject private var data = AnimeListViewModel()
  
  var body: some View {
    NavigationView {
      List {
        ForEach(data.animes ?? [], id: \.mal_id) { anime in
          NavigationLink(
            destination: AnimeDetailView(anime),
            label: {
              AnimeListRowView(anime: AnimeRowDetail.fromAnime(anime))
            })
        }
        if data.shouldDisplayNextPage {
          nextPageView
        }
      }
      .navigationTitle("Top animes")
      .onAppear {
        data.fetchAnimes()
      }
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

struct AnimeListView_Previews: PreviewProvider {
  static var previews: some View {
    AnimeListView()
  }
}
