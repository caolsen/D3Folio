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
    api = ProfileApi(route: .profile(account: "Lyngbakyr-1153"), environment: .production)
  }

  func getProfile(completion: @escaping() -> Void) {
    service.request(api) { [weak self] (data, response, error) in
      guard let data = data else {
        print("data is nil")
        return
      }

      do {
        let profile: Profile = try JSONParser.parse(data: data)
        self?.profile = profile
        DispatchQueue.main.async {
          completion()
        }
      } catch {
        print(error.localizedDescription)
      }
    }
  }
}

