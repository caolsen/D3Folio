//
//  ProfileViewModel.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/5/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

class ProfileViewModel {

  private let service: NetworkService
  private let api: ProfileApi

  var profile: Profile?

  init() {
    // TODO: dependency injection
    service = Service()
    api = ProfileApi(route: .profile(account: "AgileGull-1805"), environment: .production)
  }

  func getProfile() {
    service.request(api) { [weak self] (data, response, error) in
      guard let data = data else {
        // handle error
        return
      }

      do {
        let profile: Profile = try JSONParser.parse(data: data)
        self?.profile = profile
        print(profile)
      } catch {
        // handle error
      }
    }
  }
}

