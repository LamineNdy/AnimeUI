//
//  CharactersListViewModel..swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 10/03/2021.
//

import Combine
import Foundation

final class CharactersListViewModel: ObservableObject {
  @Published var characters: [Character]?
  var anime: Anime
  
  init(_ anime: Anime) {
    self.anime = anime
  }
  
  private(set) var totalPage: Int?
  
  var title: String? {
    return anime.title
  }
  
  
  func fetchCharacters(httpRequester: HTTPRequester = HttpCall()) {
     httpRequester.requestResult(CharacterResult.self, APIRouter.characters(anime.mal_id))
      .map{$0.characters}
      .replaceError(with: [])
      .eraseToAnyPublisher()
      .receive(on: DispatchQueue.main)
      .assign(to: &$characters)
  }
}
