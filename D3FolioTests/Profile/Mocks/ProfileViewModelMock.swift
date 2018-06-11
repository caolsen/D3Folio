//
//  ProfileViewModelMock.swift
//  D3FolioTests
//
//  Created by Christopher Olsen on 6/10/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation
@testable import D3Folio

class ProfileViewModelMock: ProfileModel {

  var profile: Profile?
  var lastUpdated: String?
  var defeatedEnemies = [(count: String, title: String)]()

  init() {
    defeatedEnemies.append(("monsters", "1"))
    defeatedEnemies.append(("monsters", "1"))
    defeatedEnemies.append(("monsters", "1"))
  }

  func getProfile(completion: @escaping (Error?) -> Void) {
    completion(nil)
  }
}
