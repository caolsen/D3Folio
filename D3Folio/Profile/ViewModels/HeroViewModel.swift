//
//  HeroViewModel.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/9/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

/// Protocol to allow creating of mocks for unit tests
protocol HeroModel {
  
  var hero: Hero? { get set }

  func getHero(completion: @escaping(Error?) -> Void)
}

class HeroViewModel: HeroModel {

  // MARK: Private Properties

  private let service: NetworkService
  private let api: Endpoint

  // MARK: Instance Properties

  /// All the data representing a Diablo3 Hero
  var hero: Hero?

  // MARK: Initializers

  init(service: NetworkService = Service(), api: Endpoint) {
    self.service = service
    self.api = api
  }

  // MARK: Instance Functions

  func getHero(completion: @escaping(Error?) -> Void) {
    
    service.request(api) { [weak self] (data, response, error) in
      guard let data = data else {
        completion(NetworkError.missingData)
        print("data is nil")
        return
      }

      do {
        let hero: Hero = try JSONParser.parse(data: data)
        self?.hero = hero
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
