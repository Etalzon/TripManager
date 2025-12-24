//  APIErrors.swift
//  TripManager
//
//  Created by eric locci on 22/12/2025.

import Foundation

public enum APIError: Error {
  case urlError
  case noNetwork
  case decodingError(decodingError: Error)
  case serverError(statusCode: Int)
  case unknownError
  case other(error: Error?)

  public static func from(error: Error?) -> APIError {
    if let error = error as? APIError {
      return error
    }
    if let nsError = error as NSError?, nsError.code == NSURLErrorNotConnectedToInternet {
      return .noNetwork
    }
    return .other(error: error)
  }
}
