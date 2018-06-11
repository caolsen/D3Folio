//
//  ProfileViewControllerTests.swift
//  D3FolioTests
//
//  Created by Christopher Olsen on 6/9/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Quick
import Nimble
@testable import D3Folio

class ProfileViewControllerTests: QuickSpec {

  override func spec() {

    var profileViewController: ProfileViewController!

    beforeEach {
      profileViewController = UIStoryboard(name: "Profile", bundle: nil).instantiateInitialViewController() as! ProfileViewController

      UIApplication.shared.keyWindow!.rootViewController = profileViewController
      let _ = profileViewController.view
    }

    afterEach {
      profileViewController = nil
    }

    describe("enemy count stack view") {

      it("should contain a number of views equal to viewModel.defeatedEnemies.count") {

        profileViewController.viewModel = ProfileViewModelMock()
        expect(profileViewController.enemyCountStackView.arrangedSubviews.count).to(equal(profileViewController.viewModel?.defeatedEnemies.count))
      }
    }
  }
}
