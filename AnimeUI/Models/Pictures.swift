//
//  Pictures.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 12/03/2021.
//

import Foundation

//"pictures": [
//{
//"large": "https://cdn.myanimelist.net/images/characters/10/34138.jpg",
//"small": "https://cdn.myanimelist.net/images/characters/10/34138.jpg"
//}
//]

struct PicturesResult: Codable {
  let pictures: [Picture]
}

struct Picture: Codable {
  let small: String?
  
  static func placeHolder() -> Picture {
    return Picture(small: nil)
  }
}
