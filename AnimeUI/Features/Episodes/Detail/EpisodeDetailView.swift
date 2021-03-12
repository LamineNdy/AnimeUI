//
//  EpisodeDetailView.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 09/03/2021.
//

import SwiftUI

struct EpisodeDetailView: View {
  let episodeDetail: EpisodeRowDetail
  let title: String
  
  init(_ episodeDetail: EpisodeRowDetail, _ title: String) {
    self.episodeDetail = episodeDetail
    self.title = title
  }
  
  var body: some View {
    List {
      Section(header: Text("Details")) {
        InfoRowView(label: "Name",
                    icon: "info",
                    text: episodeDetail.title ?? "...")
        InfoRowView(label: "Japanese title",
                    icon: "message.fill",
                    text: episodeDetail.japaneseTitle ?? "...")
        InfoRowView(label: "Episode",
                    icon: "livephoto.play",
                    text: "\(episodeDetail.id)")
        InfoRowView(label: "Air date",
                    icon: "calendar",
                    text: episodeDetail.aired ?? "...")
      }.redacted(reason: episodeDetail.title  == nil ? .placeholder : [])
    }
    .navigationTitle(title)
    .listStyle(GroupedListStyle())
  }
}

struct EpisodeDetailView_Previews: PreviewProvider {
  static var previews: some View {
    EpisodeDetailView(EpisodeRowDetail(id: 1,
                                       title: "Some episode title",
                                       japaneseTitle: "Japanes title",
                                       aired: "March 2019"), "Some anime title")
  }
}
