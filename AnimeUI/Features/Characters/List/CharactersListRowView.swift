//
//  CharactersListRowView.swift.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 10/03/2021.
//

import SwiftUI
import Kingfisher

struct CharactersListRowView: View {
  let character: CharacterRowDetail
  
  var body: some View {
    HStack {
      if let image = character.imageUrl,
         let url = URL(string: image) {
        KFImage(url)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 50, height: 50)
          .cornerRadius(10)
      } else {
        RoundedRectangle(cornerRadius: 10)
          .frame(width: 50, height: 50)
          .foregroundColor(.gray)
      }
      VStack(alignment: .leading) {
        Text(character.name ?? "Loading...")
          .font(.title3)
          .foregroundColor(.accentColor)
          .redacted(reason: character.name == nil ? .placeholder : [])
      }
    }
  }
}

struct CharactersListRowView_swift_Previews: PreviewProvider {
  static var previews: some View {
    CharactersListRowView(character: CharacterRowDetail(id: 21, imageUrl: "https://cdn.myanimelist.net/images/characters/14/311557.jpg?s=a905f0452f62837f2b5df03fb3e30103", name: "sanji"))
  }
}
