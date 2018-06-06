//
//  ProfileEndpointMock.swift
//  D3FolioTests
//
//  Created by Christopher Olsen on 6/6/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation
@testable import D3Folio

struct ProfileEndpointMock: Endpoint {

  var baseURL: URL {
    guard let url = URL(string: "https://google.com") else { fatalError("baseURL could not be configured.")}
    return url
  }

  let path = ""
  let method: HTTPMethod = .get
  let task: HTTPTask = .request
  let headers: HTTPHeaders? = nil
}
