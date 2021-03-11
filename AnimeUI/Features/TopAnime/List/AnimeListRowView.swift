//
//  AnimeListRowView.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 07/03/2021.
//

import SwiftUI
import Kingfisher

struct AnimeListRowView: View {
  let anime: AnimeRowDetail
  
  var body: some View {
    HStack {
      if let image = anime.imageUrl,
         let url = URL(string: image) {
        KFImage(url)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 80, height: 80)
          .cornerRadius(10)
      } else {
        RoundedRectangle(cornerRadius: 10)
          .frame(width: 80, height: 80)
          .foregroundColor(.gray)
      }
      VStack(alignment: .leading) {
        Text(anime.title)
          .font(.headline)
          .foregroundColor(.accentColor)
        Text("\(anime.episodes) episode(s)")
          .font(.footnote)
          .foregroundColor(.black)
          .redacted(reason: anime.episodes == 0 ? .placeholder : [])
        Text(String(format: "Score: %.2f / 10", anime.score))
          .font(.caption)
          .foregroundColor(.secondary)
          .redacted(reason: anime.episodes == 0 ? .placeholder : [])
      }
    }
  }
}

struct AnimeListRowView_Previews: PreviewProvider {
  static var previews: some View {
    let rowDetail = AnimeRowDetail (id: 0, title: "title", url: "url", imageUrl: "image url", score: 5, episodes: 0)
    AnimeListRowView(anime: rowDetail)
  }
}
