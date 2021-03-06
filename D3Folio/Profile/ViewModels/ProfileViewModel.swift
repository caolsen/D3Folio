//
//  ProfileViewModel.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/5/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

/// Protocol to allow creating of mocks for unit tests
protocol ProfileModel {
  
  var profile: Profile? { get set }
  var lastUpdated: String? { get }
  var defeatedEnemies: [(count: String, title: String)] { get set }

  func getProfile(completion: @escaping(Error?) -> Void)
}

class ProfileViewModel: ProfileModel {

  // MARK: Private Properties

  private let service: NetworkService
  private let api: Endpoint

  // MARK: Instance Properties

  /// All the profile data representing a Diablo3 account
  var profile: Profile?

  /// Display string to represent the last time the user profile was updated.
  /// Is nil if there is no timestamp returned by the API.
  var lastUpdated: String? {
    guard let timeInterval = profile?.lastUpdated else { return nil }
    return formatDate(from: timeInterval)
  }

  /// Array of enemies defeated by an account.
  /// Can contain up to 3 items representing the 3 enemy types from the
  /// DefeatedEnemie struct. If an account has not defeated any enemies
  /// of a specific type it will not be represented in this array.
  var defeatedEnemies = [(count: String, title: String)]()

  // MARK: Initializers

  init(service: NetworkService = Service(), api: Endpoint) {
    self.service = service
    self.api = api
  }

  // MARK: Instance Functions

  func getProfile(completion: @escaping(Error?) -> Void) {
    service.request(api) { (data, response, error) in
      guard let data = data else {
        DispatchQueue.main.async {
          completion(NetworkError.missingData)
        }

        print("data is nil")
        return
      }

      do {
        let profile: Profile = try JSONParser.parse(data: data)
        self.profile = profile
        self.generateDefeatedEnemyList()
        DispatchQueue.main.async {
          completion(nil)
        }
      } catch {
        DispatchQueue.main.async {
          completion(error)
        }

        print(error.localizedDescription)
      }
    }
  }

  // MARK: Private Functions

  /// Format a T imeInterval as a string for US time.
  ///
  /// - Parameter interval: time interval (epoch time)
  /// - Returns: date formatted as "MMM dd yyyy hh:mm:ss"
  private func formatDate(from interval: TimeInterval) -> String {
    let date = Date(timeIntervalSince1970: interval)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM dd yyyy hh:mm:ss"
    dateFormatter.locale = Locale.init(identifier: "en_US")

    return dateFormatter.string(from: date)
  }

  /// For each existing tyoe of enemy generate and append a tuple to the defeatedEnemy list.
  private func generateDefeatedEnemyList() {
    if let monsters = profile?.kills?.monsters {
      defeatedEnemies.append((String(monsters), "monsters"))
    }

    if let elites = profile?.kills?.elites {
      defeatedEnemies.append((String(elites), "elites"))
    }

    if let hardcoreMonsters = profile?.kills?.hardcoreMonsters {
      defeatedEnemies.append((String(hardcoreMonsters), "hardcore monsters"))
    }
  }
}

