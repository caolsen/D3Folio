//
//  HeroViewModelMock.swift
//  D3FolioTests
//
//  Created by Christopher Olsen on 6/10/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation
@testable import D3Folio

class HeroViewModelMock: HeroModel {
  
  var hero: Hero?

  init(withStats stats: HeroStats?) {
    let hero = Hero(id: 1, name: "Hero", diabloClass: .barbarian, gender: .female, level: 1, paragonLevel: nil, stats: stats)
    self.hero = hero
  }

  func getHero(completion: @escaping (Error?) -> Void) {
    completion(nil)
  }
}
