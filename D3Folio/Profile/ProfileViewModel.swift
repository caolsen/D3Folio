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
  private let api: Endpoint

  var profile: Profile?

  init(service: NetworkService = Service(), api: Endpoint) {
    self.service = service
    self.api = api
  }

  func getProfile(completion: @escaping(Error?) -> Void) {
    service.request(api) { [weak self] (data, response, error) in
      guard let data = data else {
        completion(NetworkError.missingData)
        print("data is nil")
        return
      }

      do {
        let profile: Profile = try JSONParser.parse(data: data)
        self?.profile = profile
        DispatchQueue.main.async {
          completion(nil)
        }
      } catch {
        completion(error)
        print(error.localizedDescription)
      }
    }
  }
}

