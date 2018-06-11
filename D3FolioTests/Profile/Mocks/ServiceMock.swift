//
//  ProfileServiceMock.swift
//  D3FolioTests
//
//  Created by Christopher Olsen on 6/6/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation
@testable import D3Folio

class ServiceMock: NetworkService {

  let data: Data?

  init(profileDataType: ProfileServiceDataType) {
    switch profileDataType {
    case .good:
      data = ("{\"battleTag\":\"player\"}").data(using: .utf8)
    case .bad:
      data = ("{\"junkData\":\"junk\"}").data(using: .utf8)
    case .empty:
      data = nil
    case .kills:
      data = ("{\"battleTag\":\"player\",\"kills\":{\"monsters\":1,\"elites\":1,\"hardcoreMonsters\":1}}").data(using: .utf8)
    case .date:
      data = ("{\"battleTag\":\"player\",\"lastUpdated\":1516721909}").data(using: .utf8)
    }
  }

  init(heroDataType: HeroServiceDataType) {
    switch heroDataType {
    case .good:
      data = ("{\"id\":1,\"name\":\"player\",\"class\":\"wizard\",\"gender\":1,\"level\":1}").data(using: .utf8)
    case .bad:
      data = ("{\"junkData\":\"junk\"}").data(using: .utf8)
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
