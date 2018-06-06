//
//  Profile.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/5/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

struct Profile: Codable {
  let battleTag: String
  let paragonLevel: Int
  let paragonLevelHardcore: Int
  let paragonLevelSeason: Int
  let paragonLevelSeasonHardcore: Int
  let guildName: String

  let heroes: [Hero]
}

