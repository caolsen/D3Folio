//
//  BattleNetAuthorization.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/7/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

struct BattleNetAuthorization: Authorization {
  var apiKey: String {
    return getKeyFromPlist()
  }

  private func getKeyFromPlist() -> String {

    guard let fileUrl = Bundle.main.url(forResource: "BattleNet", withExtension: "plist"),
      let data = try? Data(contentsOf: fileUrl),
      let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] else {

      fatalError("failed to get plist")
    }

    guard let key = result?["apiKey"] as? String else { fatalError("no api key") }

    return key
  }
}
