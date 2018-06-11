//
//  DefeatedEnemies.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/7/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

/// Representation of the defeated enemy counts for different enemy types.
struct DefeatedEnemies: Codable {

  /// Total monsters defeated.
  let monsters: Int?

  /// Elite monsters defeated.
  let elites: Int?

  /// Monsters defeated by Hardcore characters.
  let hardcoreMonsters: Int?
}
