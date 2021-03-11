//
//  EpisodesListViewModel.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 09/03/2021.
//

import Combine
import Foundation

final class EpisodesListViewModel: ObservableObject {
  @Published var episodes: [Episode]?
  var anime: Anime
  
  init(_ anime: Anime) {
    self.anime = anime
  }
  
  private var cancellable: AnyCancellable?
  private(set) var totalPage: Int?
  
  var title: String? {
    return anime.title
  }
  
  var shouldDisplayNextPage: Bool {
    if episodes?.isEmpty == false,
       let totalPages = totalPage,
       currentPage < totalPages {
      return true
    }
    return false
  }
  
  var currentPage = 1 {
    didSet {
      fetchEpisodes()
    }
  }
  
  func fetchEpisodes(httpRequester: HTTPRequester = HttpCall()) {
    let fetchedPage = currentPage
    cancellable = httpRequester.requestResult(EpisodesResult.self, APIRouter.episode(anime.mal_id, currentPage))
      .map{$0.episodes}
      .replaceError(with: [])
      .eraseToAnyPublisher()
      .receive(on: DispatchQueue.main)
      .sink(receiveValue: { [weak self] episodes in
        if fetchedPage > 1 {
          self?.episodes?.append(contentsOf: episodes)
        } else {
          self?.episodes = episodes
        }
        self?.totalPage = episodes.count / PageItemCount
      })
  }
}
