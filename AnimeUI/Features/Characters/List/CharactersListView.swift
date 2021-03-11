//
//  CharactersListView.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 10/03/2021.
//

import SwiftUI

struct CharactersListView: View {
  @StateObject private var data: CharactersListViewModel
  
  init(_ anime: Anime) {
    _data =  StateObject(wrappedValue: CharactersListViewModel(anime))
  }
  
  var body: some View {
    List {
      ForEach(data.characters ?? [], id: \.mal_id) { character in
        NavigationLink(
          destination: CharacterDetailView(),
          label: {
            CharactersListRowView(character: CharacterRowDetail.fromCharacter(character))
          })
      }
    }.navigationTitle("Characters")
    .onAppear {
      data.fetchCharacters()
    }
  }
  
}
