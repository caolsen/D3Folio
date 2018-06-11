//
//  HeroViewModelTests.swift
//  D3FolioTests
//
//  Created by Christopher Olsen on 6/10/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Quick
import Nimble
@testable import D3Folio

class HeroViewModelTests: QuickSpec {

  override func spec() {
    describe("the hero api") {

      it("can fetch and parse required hero data") {

        let viewModel = HeroViewModel(service: ServiceMock(heroDataType: .good), api: EndpointMock())
        viewModel.getHero { (error) in
          expect(viewModel.hero).toNot(beNil())
        }
      }

      it("will not parse empty data") {

        let viewModel = HeroViewModel(service: ServiceMock(heroDataType: .empty), api: EndpointMock())
        viewModel.getHero { (error) in
          expect(error).to(beAnInstanceOf(NetworkError.self))
        }
      }
    }
  }
}

