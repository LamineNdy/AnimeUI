//
//  HttpCall.swift
//  AnimeUI
//
//  Created by Ndiaye, Lamine on 06/03/2021.
//

import Foundation
import Combine

protocol HTTPRequester {
  func requestResult<T>(_ type: T.Type,
                        _ request: URLRequestConvertible) -> AnyPublisher<T, HttpError> where T: Codable
}

final class HttpCall: HTTPRequester {
  private var cancellable: AnyCancellable?
  
  
  // Execute a HTTP request and decode the data on the fly with the correct Codable type
  func requestResult<T>(_ type: T.Type,
                        _ request: URLRequestConvertible) -> AnyPublisher<T, HttpError> where T: Codable {
    guard let urlRequest = request.urlRequest else {
      return Fail(error: HttpError.badUrlRequest(message: "Invalid request"))
        .eraseToAnyPublisher()
    }

    return URLSession.shared.dataTaskPublisher(for: urlRequest)
      .tryMap { output in
        guard let httpResponse = output.response as? HTTPURLResponse else {
          throw HttpError.nilDataResponse
        }
        // HTTP error
        let statusCode = httpResponse.statusCode
        guard (200...299).contains(statusCode) else {
          throw HttpError
          .serverResponse(status: httpResponse.statusCode, message: nil)
        }
        return output.data
      }
      .decode(type: T.self, decoder: JSONDecoder())
      .mapError { HttpError.map($0) }
      .eraseToAnyPublisher()
  }
}
