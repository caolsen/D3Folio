//
//  ProfileApi.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/5/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

/// API routes for the Battle.net Profile API.
///
/// - profile: Retrieves the profile for a given account.
/// - hero: Retrieves the hero info for an account and hero ID.
enum ProfileApiRoute {
  case profile(account: String)
  case hero(account: String, hero: String)
}

/// Configuration for the Profile API
struct ProfileApi {

  /// Route to use for the call.
  let route: ProfileApiRoute

  /// Environment to hit. Only using Production for this app.
  let environment: NetworkEnvironment

  /// Battle.net API key
  let apiKey: String

  /// Creates a new Profile API for a specific route and environment.
  ///
  /// - Parameters:
  ///   - authorization: Object that provides the auth token. Defaults to the BattleNetAuthorization
  ///   - route: Route to use
  ///   - environment: Environment to use
  init(authorization: Authorization = BattleNetAuthorization(), route: ProfileApiRoute, environment: NetworkEnvironment) {
    self.route = route
    self.environment = environment
    self.apiKey = authorization.apiKey
  }
}

extension ProfileApi: Endpoint {

  /// Base URL string, determined by environment. I don't have access to Battle.net's envs,
  /// so this only returns the production URL String.
  var environmentBaseURL : String {
    switch environment {
    default:
      return "https://us.api.battle.net/d3/profile/"
    }
  }

  /// Creates and returns a URL object using the environmentBaseURL. If this fails there is a larger problem.
  var baseURL: URL {
    guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
    return url
  }

  /// Returns API route to append to the base url.
  var path: String {
    switch route {
    case .profile(let account):
      return "\(account)/"
    case .hero(let account, let hero):
      return "\(account)/hero/\(hero)/"
    }
  }

  /// This API only uses GET verbs.
  var method: HTTPMethod {
    return .get
  }

  /// Returns query parameters to append to the base url.
  var task: HTTPTask {
    switch route {
    case .profile(_), .hero(_, _):
      return .requestParameters(bodyParameters: nil, urlParameters: ["locale": "en_US", "apiKey": apiKey])
    }
  }

  /// Not used for this API.
  var headers: HTTPHeaders? {
    return nil
  }
}

