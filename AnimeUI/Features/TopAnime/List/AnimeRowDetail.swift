//
//  AnimeRowDetail.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 07/03/2021.
//

import Foundation

struct AnimeRowDetail {
  let id: Int
  let title: String
  let url: String?
  let imageUrl: String?
  let score: Double
  let episodes: Int
  
  static func fromAnime(_ anime: Anime) -> AnimeRowDetail {
    return AnimeRowDetail(id: anime.mal_id,
                          title: anime.title,
                          url: anime.url,
                          imageUrl: anime.image_url,
                          score: anime.score,
                          episodes: anime.episodes ?? 0)
  }
}
