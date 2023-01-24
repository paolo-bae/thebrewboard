//
//  DataParser.swift
//  TheBrewBoard
//
//  Created by Paolo Baeli on 21/01/23.
//
import Foundation

protocol DataParserProtocol {
  func parse<T: Decodable>(data: Data) throws -> T
}

class DataParser: DataParserProtocol {
  private var jsonDecoder: JSONDecoder

  init(jsonDecoder: JSONDecoder = JSONDecoder()) {
    self.jsonDecoder = jsonDecoder
  }

  func parse<T: Decodable>(data: Data) throws -> T {
      return try jsonDecoder.decode(T.self, from: data)
  }
}
