//
//  Pager.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 09/03/2021.
//

import Foundation

let PageItemCount = 20

protocol PagerViewModel {
  var currentPage: Int { get set }
  var shouldDisplayNextPage: Bool { get }
  func fetch()
}
