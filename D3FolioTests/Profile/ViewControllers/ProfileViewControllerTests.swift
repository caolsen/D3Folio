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
    }

    afterEach {
      profileViewController = nil
    }

    describe("viewDidLoad:") {

      beforeEach {
        let _ = profileViewController.view
      }

      
    }
  }
}
