//
//  Anime.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 07/03/2021.
//

import Foundation

/*
 top : [
   {
   "mal_id": 1535,
   "rank": 1,
   "title": "Death Note",
   "url": "https://myanimelist.net/anime/1535/Death_Note",
   "image_url": "https://cdn.myanimelist.net/images/anime/9/9453.jpg?s=b89e80691ac5cc0610847ccbe0b8424a",
   "type": "TV",
   "episodes": 37,
   "start_date": "Oct 2006",
   "end_date": "Jun 2007",
   "members": 2633469,
   "score": 8.63
   }
 ]
 */

struct TopAnimes: Codable {
  let top: [Anime]
}

struct Anime: Codable {
  let mal_id: Int
  let rank: Int
  let title: String
  let url: String?
  let image_url: String?
  let type: String?
  let episodes: Int?
  let start_date: String?
  let end_date: String?
  let score: Double
}
