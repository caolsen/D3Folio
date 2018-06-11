//
//  JSONParameterEncoderTests.swift
//  D3FolioTests
//
//  Created by Christopher Olsen on 6/9/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Quick
import Nimble
@testable import D3Folio

class URLParameterEncoderTests: QuickSpec {

  override func spec() {
    describe(".encode(request:with:)") {
      it("should add query parameters to the url") {

        let url = URL(string: "https://google.com")
        var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        let parameters = ["locale": "en_US"]

        try! URLParameterEncoder.encode(request: &request, with: parameters)

        expect(request.url?.absoluteString).to(equal("https://google.com?locale=en_US"))
      }
    }
  }
}
