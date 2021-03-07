//
//  HttpError.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 06/03/2021.
//

import Foundation

enum HttpError: Error {
  case noInternetConnection
  case nilHttpResponse
  case nilDataResponse
  case invalidDataFormat
  case serverResponse(status: Int, message: String?)
  case badUrlRequest(message: String)
  case error(_ error: Error)
  
  var statusCode: Int {
    switch self {
      case let .serverResponse(status: code, _):
        return code
      default:
        return -1000
    }
  }
  
  static func map(_ error: Error) -> HttpError {
    return (error as? HttpError) ?? .error(error)
  }
}
