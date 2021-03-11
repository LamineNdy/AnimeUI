//
//  AnimeListViewModel.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 07/03/2021.
//

import Combine
import Foundation

final class AnimeListViewModel: ObservableObject {
  @Published var animes: [Anime]?
  
  private var cancellable: AnyCancellable?
  private(set) var totalPage: Int?
  
  var shouldDisplayNextPage: Bool {
    if animes?.isEmpty == false,
       let totalPages = totalPage,
       currentPage < totalPages {
      return true
    }
    return false
  }
  
  var currentPage = 1 {
    didSet {
      fetchAnimes()
    }
  }
  
  func fetchAnimes(httpRequester: HTTPRequester = HttpCall()) {
    let fetchedPage = currentPage
    cancellable = httpRequester.requestResult(TopAnimes.self, APIRouter.top(currentPage))
      .map{$0.top}
      .replaceError(with: [])
      .eraseToAnyPublisher()
      .receive(on: DispatchQueue.main)
      .sink(receiveValue: { [weak self] animes in
        if fetchedPage > 1 {
          self?.animes?.append(contentsOf: animes)
        } else {
          self?.animes = animes
        }
        self?.totalPage = animes.count / PageItemCount
      })
  }
}
