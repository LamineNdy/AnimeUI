//
//  Router.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 06/03/2021.
//

import Foundation

enum API {
//  https://api.jikan.moe/v3/top/anime/1/bypopularity
// /search/anime?q=Fate/Zero&page=1
// https://api.jikan.moe/v3/top/anime/anime/1/bypopularity
  static let scheme = "https"
  static let host = "api.jikan.moe"
  static let version = "v3"
  static let type = "anime"
  static let top = "top"
  static let search = "?q="
  static let subtype = "bypopularity"
}

enum APIRouter: URLRequestConvertible {
  case top(Int)
  case search(String, Int)
  
  // MARK: - Method
  var method: HTTPMethod {
    // We can also directly return .get as there is just one case
    switch self {
      case .top:
        return .get
      case .search:
        return .get
    }
  }
  
  // MARK: - Request
  func asURLRequest() throws -> URLRequest {
    let urlString: String = {
      let endpointBase = "\(API.scheme)://\(API.host)/\(API.version)"
      switch self {
        case .top(let page):
          return endpointBase + "/\(API.top)/\(API.type)/\(page)/\(API.subtype)"
        case .search(let query, let page):
          return  endpointBase + "/\(API.type)/?q=\(query)&page=\(page)"
      }
    }()
    var request = URLRequest(url: try urlString.asURL())
    request.httpMethod = method.rawValue
    request.timeoutInterval = 30.0
    return request
  }
}
