//
//  EpisodeRowDetail.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 09/03/2021.
//

import Foundation

struct EpisodeRowDetail {
  let id: Int
  let title: String?
  let japaneseTitle: String?
  let aired: String?
  
  static func fromEpisode(_ episode: Episode) -> EpisodeRowDetail {
    var airedDate = ""
    if let aired = episode.aired {
      let formatter = DateFormatter()
      formatter.locale = Locale(identifier: "en_US_POSIX")
      formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
      if let date = formatter.date(from: aired) {
        formatter.dateFormat = "MMM d, yyyy"
        airedDate = formatter.string(from: date)
      }
    }
    return EpisodeRowDetail(id: episode.episode_id,
                            title: episode.title,
                            japaneseTitle: episode.title_japanese,
                            aired: airedDate)
  }
  
  static func placeHolder() -> EpisodeRowDetail {
    return EpisodeRowDetail(id: 1, title: nil, japaneseTitle: nil, aired: nil)
  }

}
