//
//  GetStartedViewControllerTests.swift
//  D3FolioTests
//
//  Created by Christopher Olsen on 6/9/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Quick
import Nimble
@testable import D3Folio

class GetStartedViewControllerTests: QuickSpec {

  override func spec() {

    describe("The GetStartedViewController") {

      var getStartedViewController: GetStartedViewController!

      beforeEach {
        let navigationController = UIStoryboard(name: "GetStarted", bundle: nil).instantiateInitialViewController() as! UINavigationController
        getStartedViewController = navigationController.viewControllers.first as! GetStartedViewController

        UIApplication.shared.keyWindow!.rootViewController = getStartedViewController
        let _ = navigationController.view
        let _ = getStartedViewController.view
      }

      afterEach {
        getStartedViewController = nil
      }

      context("when a segue is triggered") {
        it("should not execute when either text field is empty") {
          let bool = getStartedViewController.shouldPerformSegue(withIdentifier: "ProfileShow", sender: self)
          expect(bool).to(beFalse())
        }

        it("should execute when text fields are not empty") {
          getStartedViewController.accountNameTextField.text = "hello"
          getStartedViewController.tagIdTextField.text = "world"
          let bool = getStartedViewController.shouldPerformSegue(withIdentifier: "ProfileShow", sender: self)
          expect(bool).to(beTrue())
        }
      }

      context("account name text field return key is pressed") {
        it("should move first respnder to tagId text field") {
          let _ = getStartedViewController.textFieldShouldReturn(getStartedViewController.accountNameTextField)
          expect(getStartedViewController.tagIdTextField.isFirstResponder).to(beTrue())
        }
      }
    }
  }
}

