//
//  RequestHelper.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 06/03/2021.
//

import Foundation

protocol URLRequestConvertible {
  func asURLRequest() throws -> URLRequest
}

extension URLRequestConvertible {
  var urlRequest: URLRequest? { return try? asURLRequest() }
}

protocol URLConvertible {
  func asURL() throws -> URL
}

extension String: URLConvertible {
  func asURL() throws -> URL {
    guard let url = URL(string: self) else { throw HttpError.badUrlRequest(message: "Bad url format") }
    return url
  }
}

extension URL: URLConvertible {
  func asURL() throws -> URL { return self }
}

extension URLRequest: URLRequestConvertible {
  func asURLRequest() throws -> URLRequest { return self }
}

enum HTTPMethod: String {
  case options
  case get
  case head
  case post
  case put
  case patch
  case delete
  case trace
  case connect
}
