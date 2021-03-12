//
//  EpisodeListRowView.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 09/03/2021.
//

import SwiftUI

struct EpisodesListRowView: View {
  let episode: EpisodeRowDetail
  
  var body: some View {
    HStack(alignment: .center) {
      VStack(alignment: .leading) {
        Text(episode.title ?? "Loading...")
          .foregroundColor(.accentColor)
        Text(episode.japaneseTitle ?? "")
          .font(.footnote)
          .redacted(reason: episode.japaneseTitle == nil ? .placeholder : [])
      }
      Spacer()
      Text(episode.aired ?? "N/A")
        .foregroundColor(.gray)
        .font(.footnote)
    }.redacted(reason: episode.title == nil ? .placeholder : [])
  }
}
