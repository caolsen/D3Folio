//
//  HeroStats.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/9/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

/// Representation of a Diablo 3 Hero's stats.
struct HeroStats: Codable {
  let strength: Double
  let dexterity: Double
  let vitality: Double
  let intelligence: Double
}
