//
//  Profile.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/5/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

struct Profile: Codable {
  let battleTag: String
  let heroes: [Hero]?
}

