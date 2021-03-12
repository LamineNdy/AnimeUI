//
//  Character.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 09/03/2021.
//

import Foundation

//"characters": [
//  {
//  "mal_id": 720,
//  "url": "https://myanimelist.net/character/720/Anna_Liebert",
//  "image_url": "https://cdn.myanimelist.net/images/characters/11/286916.jpg?s=ff0b6e37a427c9498f5a1ecd40bf7bb4",
//  "name": "Liebert, Anna",
//  "role": "Main"
//  }
//]

struct CharacterResult: Codable {
  var characters: [Character]
}

struct Character: Codable {
  var mal_id: Int
  var image_url: String?
  var name: String?
  
  static func placeHolder() -> Character {
    return Character(mal_id: 1, image_url: nil, name: nil)
  }
}
