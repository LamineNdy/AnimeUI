//
//  CharacterRowDetail.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 10/03/2021.
//

import Foundation

struct CharacterRowDetail {
  var id: Int
  var imageUrl: String?
  var name: String?
  
  static func fromCharacter(_ character: Character) -> CharacterRowDetail {
    return CharacterRowDetail (
      id: character.mal_id,
      imageUrl: character.image_url,
      name: character.name
    )
  }
}
