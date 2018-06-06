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
}

class ProfileServiceMock: NetworkService {

  let data: Data?

  init(_ requestDataType: RequestDataType) {
    switch requestDataType {
    case .good:
      data = ("{\"battleTag\":\"player\"}").data(using: .utf8)
    case .bad:
      data = ("{\"battleTag\":\"player\", \"junkData\":\"junk\"}").data(using: .utf8)
    case .empty:
      data = nil
    }
  }

  func request(_ route: Endpoint, completion: @escaping NetworkServiceCompletion) {
    completion(data, nil, nil)
  }

  func cancel() {
    
  }
}
