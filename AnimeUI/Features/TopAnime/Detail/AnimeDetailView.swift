//
//  AnimeDetailView.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 11/03/2021.
//

import SwiftUI

enum DetailViewType: String, CaseIterable, Identifiable {
  case Characters
  case Episodes
  
  var id: String { self.rawValue }
}

struct AnimeDetailView: View {
  @State private var selectedFlavor = DetailViewType.Characters
  
  var anime: Anime
  
  init(_ anime: Anime) {
    self.anime = anime
  }
  
  var body: some View {
    VStack {
      Picker("Episode Views", selection: $selectedFlavor) {
        ForEach(DetailViewType.allCases) { viewType in
          Text(viewType.id).tag(viewType)
        }
      }
      .pickerStyle(SegmentedPickerStyle())
      
      if selectedFlavor == .Characters {
        CharactersListView(anime)
      } else {
        EpisodesListView(anime)
      }
    }
  }
}
