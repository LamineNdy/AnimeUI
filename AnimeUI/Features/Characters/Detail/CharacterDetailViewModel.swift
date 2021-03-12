//
//  CharacterDetailViewModel.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 12/03/2021.
//

import Combine
import Foundation

typealias PicturePair = (id: Int, first: Picture, second: Picture?)

final class CharacterDetailViewModel: ObservableObject {
  @Published var pictures: [PicturePair]?
  var character: Character
  private var cancellable: AnyCancellable?
  
  init(_ character: Character) {
    self.character = character
  }
  
  var title: String? {
    return character.name
  }
    
  func fetchPictures(httpRequester: HTTPRequester = HttpCall()) {
    cancellable = httpRequester.requestResult(PicturesResult.self,
                                              APIRouter.charactersPictures(character.mal_id))
      .map{$0.pictures}
      .replaceError(with: [])
      .eraseToAnyPublisher()
      .receive(on: DispatchQueue.main)
      .sink(receiveValue: {[weak self] pics in
        self?.pictures = []
        let len = pics.count
        for i in stride(from: 0, to: len, by: 2) {
          let pair = PicturePair(id: i, first: pics[i], second: i < len ? pics[i+1] : nil)
          self?.pictures?.append(pair)
        }
      })
  }
}
