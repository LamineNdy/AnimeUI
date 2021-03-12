//
//  Router.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 06/03/2021.
//

import Foundation

/* https://api.jikan.moe/v3/top/anime/1/bypopularity
 * https://api.jikan.moe/v3/search/anime?q=Fate/Zero&page=1
 * https://api.jikan.moe/v3/anime/1/episodes
 * https://api.jikan.moe/v3/manga/1/characters
 * https://api.jikan.moe/v3/character/1/pictures
*/
enum API {
  static let scheme = "https"
  static let host = "api.jikan.moe"
  static let version = "v3"
  static let type = "anime"
}

enum APIRouter: URLRequestConvertible {
  case characters(Int)
  case charactersPictures(Int)
  case episode(Int, Int)
  case search(String, Int)
  case top(Int)
  
  // MARK: - Method
  var method: HTTPMethod {
    return .get
  }
  
  // MARK: - Request
  func asURLRequest() throws -> URLRequest {
    let urlString: String = {
      let endpointBase = "\(API.scheme)://\(API.host)/\(API.version)"
      switch self {
        case .characters(let id):
        return endpointBase + "/\(API.type)/\(id)/characters_staff"
        case .charactersPictures(let id):
          return endpointBase + "/character/\(id)/pictures"
        case .episode(let id, let page):
          return endpointBase + "/\(API.type)/\(id)/episodes/\(page)"
        case .search(let query, let page):
          return endpointBase + "/search/\(API.type)/?q=\(query)&page=\(page)"
        case .top(let page):
          return endpointBase + "/top/\(API.type)/\(page)/bypopularity"
      }
    }()
    var request = URLRequest(url: try urlString.asURL())
    request.httpMethod = method.rawValue
    request.timeoutInterval = 30.0
    return request
  }
}
