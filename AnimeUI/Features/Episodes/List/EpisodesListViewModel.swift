//
//  EpisodesListViewModel.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 09/03/2021.
//

import Combine
import Foundation

final class EpisodesListViewModel: ObservableObject {
  @Published var episodeDetails: [EpisodeRowDetail]?
  var anime: Anime
  
  private var cancellable: AnyCancellable?
  private(set) var totalPage: Int?
  
  var title: String? {
    return anime.title
  }
  
  var shouldDisplayNextPage: Bool {
    if episodeDetails?.isEmpty == false,
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
    
  init(_ anime: Anime) {
    self.anime = anime
  }
  
  func fetchEpisodes(httpRequester: HTTPRequester = HttpCall()) {
    let fetchedPage = currentPage
    cancellable = httpRequester.requestResult(EpisodesResult.self, APIRouter.episode(anime.mal_id, currentPage))
      .map{$0.episodes}
      .replaceError(with: [])
      .eraseToAnyPublisher()
      .receive(on: DispatchQueue.main)
      .sink(receiveValue: { [weak self] episodes in
        let episodeDetails = episodes.map{EpisodeRowDetail.fromEpisode($0)}
        if fetchedPage > 1 {
          self?.episodeDetails?.append(contentsOf: episodeDetails)
        } else {
          self?.episodeDetails = episodeDetails
        }
        self?.totalPage = episodes.count / PageItemCount
      })
  }
}
