//
//  ProfileServiceMock.swift
//  D3FolioTests
//
//  Created by Christopher Olsen on 6/6/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation
@testable import D3Folio

enum RequestDataType {
  case good
  case bad
  case empty
  case kills
}

class ProfileServiceMock: NetworkService {

  let data: Data?

  init(_ requestDataType: RequestDataType) {
    switch requestDataType {
    case .good:
      data = ("{\"battleTag\":\"player\"}").data(using: .utf8)
    case .bad:
      data = ("{\"junkData\":\"junk\"}").data(using: .utf8)
    case .empty:
      data = nil
    case .kills:
      data = ("{ \"battleTag\":\"player\", \"kills\": { \"monsters\": 1, \"elites\": 1, \"hardcoreMonsters\": 1 } }").data(using: .utf8)
    }
  }

  func request(_ route: Endpoint, completion: @escaping NetworkServiceCompletion) {
    completion(data, nil, nil)
  }

  func cancel() {
    
  }
}
