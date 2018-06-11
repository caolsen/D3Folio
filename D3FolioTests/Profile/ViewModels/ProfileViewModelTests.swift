//
//  ProfileApiTests.swift
//  D3FolioTests
//
//  Created by Christopher Olsen on 6/6/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Quick
import Nimble
@testable import D3Folio

class ProfileViewModelTests: QuickSpec {

  override func spec() {
    describe("the profile api") {

      it("can fetch and parse profile data") {

        let viewModel = ProfileViewModel(service: ServiceMock(profileDataType: .good), api: EndpointMock())
        viewModel.getProfile { (error) in
          expect(viewModel.profile).toNot(beNil())
        }
      }

      it("will not parse empty data") {
        
        let viewModel = ProfileViewModel(service: ServiceMock(profileDataType: .empty), api: EndpointMock())
        viewModel.getProfile { (error) in
          expect(error).to(beAnInstanceOf(NetworkError.self))
        }
      }

      it("requires a battleTag in the response data") {

        let viewModel = ProfileViewModel(service: ServiceMock(profileDataType: .bad), api: EndpointMock())
        viewModel.getProfile { (error) in
          expect(error).to(beAKindOf(NetworkError.self))
        }
      }

      it("last updated should not be nil") {

        let viewModel = ProfileViewModel(service: ServiceMock(profileDataType: .date), api: EndpointMock())
        viewModel.getProfile { (error) in
          expect(viewModel.lastUpdated).toNot(beNil())
        }
      }

      context("defeated enemies") {

        it("should contain 3 items") {

          let viewModel = ProfileViewModel(service: ServiceMock(profileDataType: .kills), api: EndpointMock())
          viewModel.getProfile { (error) in
            expect(viewModel.defeatedEnemies.count).to(equal(3))
          }
        }
      }
    }
  }
}
