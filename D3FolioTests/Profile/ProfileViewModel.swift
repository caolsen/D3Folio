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

        let viewModel = ProfileViewModel(service: ProfileServiceMock(.good), api: ProfileEndpointMock())
        viewModel.getProfile { (error) in
          expect(viewModel.profile).toNot(beNil())
        }
      }

      it("will not parse empty data") {
        
        let viewModel = ProfileViewModel(service: ProfileServiceMock(.empty), api: ProfileEndpointMock())
        viewModel.getProfile { (error) in
          expect(error).to(beAnInstanceOf(NetworkError.self))
        }
      }

      it("can handle extra properties") {
        let viewModel = ProfileViewModel(service: ProfileServiceMock(.bad), api: ProfileEndpointMock())
        viewModel.getProfile { (error) in
          expect(viewModel.profile).toNot(beNil())
        }
      }
    }
  }
}