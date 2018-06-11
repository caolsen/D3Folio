//
//  HeroViewControllerTests.swift
//  D3FolioTests
//
//  Created by Christopher Olsen on 6/10/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Quick
import Nimble
@testable import D3Folio

class HeroViewControllerTests: QuickSpec {

  override func spec() {

    var heroViewController: HeroViewController!

    /// Default hero that shoul,d be set before each test. Would normally be passed from ProfileViewController
    let defaultHero = Hero(id: 1, name: "Hero", diabloClass: .barbarian, gender: .female, level: 1, paragonLevel: nil, stats: nil)

    /// Hero with paragon levels to be used with tests that require paragon levels
    let paragonHero = Hero(id: 1, name: "Hero", diabloClass: .barbarian, gender: .female, level: 1, paragonLevel: 1, stats: nil)

    beforeEach {
      heroViewController = UIStoryboard(name: "Hero", bundle: nil).instantiateInitialViewController() as! HeroViewController
    }

    afterEach {
      heroViewController = nil
    }

    describe("the paragon level label") {

      it("should be visible if hero has a paragon level") {
        heroViewController.hero = paragonHero
        let _ = heroViewController.view

        expect(heroViewController.paragonLevelLabel.isHidden).to(beFalse())
      }

      it("should be hidden if paragon level is nil") {
        heroViewController.hero = defaultHero
        let _ = heroViewController.view

        expect(heroViewController.paragonLevelLabel.isHidden).to(beTrue())
      }
    }

    describe("the hero stats section") {

      beforeEach {
        heroViewController.hero = defaultHero
        let _ = heroViewController.view
      }

      it("should be visible if there are stats") {
        let heroStats = HeroStats(strength: 10, dexterity: 10, vitality: 10, intelligence: 10)
        let viewModel = HeroViewModelMock(withStats: heroStats)
        heroViewController.viewModel = viewModel
        expect(heroViewController.attributesStackView.alpha).to(equal(1.0))
      }

      it("should be hidden if there are no stats") {
        let viewModel = HeroViewModelMock(withStats: nil)
        heroViewController.viewModel = viewModel
        expect(heroViewController.attributesStackView.alpha).to(equal(0.0))
      }
    }
  }
}
