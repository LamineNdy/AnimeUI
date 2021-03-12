//
//  CharacterDetailView.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 10/03/2021.
//

import Kingfisher
import SwiftUI

struct CharacterDetailView: View {
  @StateObject private var data: CharacterDetailViewModel
  
  init(_ character: Character) {
    _data = StateObject(wrappedValue: CharacterDetailViewModel(character))
  }
  
  var body: some View {
    let item = Picture.placeHolder()
    let placeHolders = Array(repeating: PicturePair(id: 1,
                                          first: item,
                                          second: item), count: 10)
    List {
      ForEach(data.pictures ?? placeHolders, id: \.id) { picPair in
        HStack {
          if let image = picPair.first.small,
             let url = URL(string: image) {
            KFImage(url)
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 150, height: 150)
              .cornerRadius(10)
          } else {
            RoundedRectangle(cornerRadius: 10)
              .scaledToFit()
              .foregroundColor(.gray)
          }
          Spacer()
          if let image = picPair.second?.small,
             let url = URL(string: image) {
            KFImage(url)
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 150, height: 150)
              .cornerRadius(10)
          } else {
            RoundedRectangle(cornerRadius: 10)
              .scaledToFit()
            .foregroundColor(.gray)
          }
        }
      }
      
    }
    .navigationTitle(data.title ?? "N/A").redacted(reason: data.title == nil ? .placeholder : [])
    .onAppear {
      data.fetchPictures()
    }
  }
}

struct CharacterDetailView_Previews: PreviewProvider {
  static var previews: some View {
    CharacterDetailView(Character(mal_id: 1, image_url: nil, name: "Some name"))
  }
}
