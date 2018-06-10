//
//  ProfileApi.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/5/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

enum ProfileApiRoute {
  case profile(account: String)
  case hero(account: String, hero: String)
}

struct ProfileApi {
  let route: ProfileApiRoute
  let environment: NetworkEnvironment
  let apiKey: String

  init(authorization: Authorization = BattleNetAuthorization(), route: ProfileApiRoute, environment: NetworkEnvironment) {
    self.route = route
    self.environment = environment
    self.apiKey = authorization.apiKey
  }
}

extension ProfileApi: Endpoint {

  var environmentBaseURL : String {
    switch environment {
    // I don't have access to Battle.net's envs, so only return prod
    default:
      return "https://us.api.battle.net/d3/profile/"
    }
  }

  var baseURL: URL {
    guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
    return url
  }

  var path: String {
    switch route {
    case .profile(let account):
      return "\(account)/"
    case .hero(let account, let hero):
      return "\(account)/hero/\(hero)/"
    }
  }

  var method: HTTPMethod {
    return .get
  }

  var task: HTTPTask {
    switch route {
    case .profile(_), .hero(_, _):
      return .requestParameters(bodyParameters: nil, urlParameters: ["locale": "en_US", "apiKey": apiKey])
    }
  }

  var headers: HTTPHeaders? {
    return nil
  }
}

