//
//  Hero.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/6/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import UIKit

/// Enum representation of Diablo 3 gender. Fairly self explanatory.
enum Gender: Int, Codable {
  case male = 0
  case female = 1
}

/// Enum representation of a Diablo 3 class.
///
/// - barbarian: savage wanderer
/// - crusader: unbending champion
/// - demonHunter: relentless vigilante
/// - monk: sacred warrior
/// - necromancer: ruthless commander
/// - witchDoctor: spiritual warrior
/// - wizard: renegade spellcaster
enum DiabloClass: String, Codable {
  case barbarian = "barbarian"
  case crusader = "crusader"
  case demonHunter = "demon-hunter"
  case monk = "monk"
  case necromancer = "necromancer"
  case witchDoctor = "witch-doctor"
  case wizard = "wizard"
}

/// Representation of  Diablo 3 Hero.
/// Used as a model in both the Profile and Hero ViewControllers.
///
/// NOTE: Hero data is subject to going inactive if the hero has not been recently used.
struct Hero: Codable {

  /// Internal battle.net id. Unique.
  let id: Int

  /// Hero's name. Non-unique
  let name: String

  /// Hero's class. Used to determine portrait.
  let diabloClass: DiabloClass

  /// Binary gender. Used to determine portrait.
  let gender: Gender

  /// Current character level
  let level: Int

  /// Character's paragon level. This will vary between normal, seasonal, and hardcore characters.
  let paragonLevel: Int

  /// Returns the proper portrait for a hero. Portraits are static images
  /// determined by the combination of class and gender.
  var portrait: UIImage {
    return heroImage()
  }

  /// This is needed because class is a reserved word in swift :\
  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case diabloClass = "class"
    case gender
    case level
    case paragonLevel
  }

  /// Determines hero portrait image. I'm not a huge fan of long switches,
  /// but the logic is simple and easily readable for now.
  ///
  /// - Returns: image representing the hero portrait
  private func heroImage() -> UIImage {
    switch (diabloClass, gender) {
    case (.barbarian, .female):
      return #imageLiteral(resourceName: "barb_female")
    case (.barbarian, .male):
      return #imageLiteral(resourceName: "barb_male")
    case (.crusader, .female):
      return #imageLiteral(resourceName: "crusader_female")
    case (.crusader, .male):
      return #imageLiteral(resourceName: "crusader_male")
    case (.demonHunter, .female):
      return #imageLiteral(resourceName: "demon_hunter_female")
    case (.demonHunter, .male):
      return #imageLiteral(resourceName: "demon_hunter_male")
    case (.monk, .female):
      return #imageLiteral(resourceName: "monk_female")
    case (.monk, .male):
      return #imageLiteral(resourceName: "monk_male")
    case (.necromancer, .female):
      return #imageLiteral(resourceName: "necromancer_female")
    case (.necromancer, .male):
      return #imageLiteral(resourceName: "necromancer_male")
    case (.witchDoctor, .female):
      return #imageLiteral(resourceName: "witch_doctor_female")
    case (.witchDoctor, .male):
      return #imageLiteral(resourceName: "witch_doctor_male")
    case (.wizard, .female):
      return #imageLiteral(resourceName: "wizard_female")
    case (.wizard, .male):
      return #imageLiteral(resourceName: "wizard_male")
    }
  }
}
