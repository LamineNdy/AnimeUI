//
//  Episode.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 09/03/2021.
//

import Foundation

/*
 "episodes": [
   {
   "episode_id": 1,
   "title": "Asteroid Blues",
   "title_japanese": "アステロイド・ブルース",
   "title_romanji": "Asteroid Blues ",
   "aired": "1998-10-24T00:00:00+00:00",
   "filler": false,
   "recap": false,
   "video_url": "https://myanimelist.net/anime/1/Cowboy_Bebop/episode/1",
   "forum_url": "https://myanimelist.net/forum/?topicid=29264"
   }
 ]
 */

struct EpisodesResult: Codable {
  let episodes: [Episode]
}

struct Episode: Codable {
  let episode_id: Int
  let title: String?
  let title_japanese: String?
  let aired: String?
}
