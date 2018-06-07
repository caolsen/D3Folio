//
//  ProfilePerformanceTests.swift
//  D3FolioTests
//
//  Created by Christopher Olsen on 6/7/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import XCTest
@testable import D3Folio

class ProfilePerformanceTests: XCTestCase {

  var controllerUnderTest: ProfileViewController!

  override func setUp() {
    super.setUp()
    let navigationController = UIStoryboard(name: "Profile", bundle: nil).instantiateInitialViewController() as! UINavigationController
    controllerUnderTest = navigationController.viewControllers.first as! ProfileViewController

    UIApplication.shared.keyWindow!.rootViewController = controllerUnderTest
    let _ = navigationController.view
    let _ = controllerUnderTest.view
  }

  override func tearDown() {
    controllerUnderTest = nil
    super.tearDown()
  }

  func testGetProfilePerformance() {
    measure {
      controllerUnderTest.getData()
    }
  }
}
