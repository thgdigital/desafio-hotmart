//
//  NetworkError.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 25/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation

enum NetworkError: Error, Equatable {
  case http(statusCode: Int, rawResponseData: Data)
  case jsonDecoding
  case timeout
  case noConnection
  case unknown(nestedError: Error?)
  
  static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        return lhs.description == rhs.description
  }
}

extension NetworkError: CustomDebugStringConvertible {

  var debugDescription: String {
    return localizedDescription
  }

}

extension NetworkError: CustomStringConvertible {

  var description: String {
    switch self {
    case .http(let statusCode, let rawResponseData):
      return """
      \(statusCode)
      \(String(data: rawResponseData, encoding: .utf8) ?? "")
      """

    case .jsonDecoding:
      return "JsonDecodingError:"

    case .timeout:
      return "timeout"

    case .noConnection:
      return "no connection"

    case .unknown(let nestedError):
      var desc =  "unknown error"

      if let nestedError = nestedError {
        desc += ": \(nestedError.localizedDescription)"
      }

      return desc
      
  }

  var localizedDescription: String {
    return description
  }

}
}
