//
//  Hero.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/6/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

enum Gender: Int, Codable {
  case male = 0
  case female = 1
}

enum DiabloClass: String, Codable {
  case barbarian = "barbarian"
  case crusader = "crusader"
  case demonHunter = "demon-hunter"
  case monk = "monk"
  case necromancer = "necromancer"
  case witchDoctor = "witch-doctor"
  case wizard = "wizard"
}

struct Hero: Codable {
  let id: Int
  let name: String
  let diabloClass: DiabloClass
  let gender: Gender
  let level: Int
  let paragonLevel: Int

  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case diabloClass = "class"
    case gender
    case level
    case paragonLevel
  }
}
