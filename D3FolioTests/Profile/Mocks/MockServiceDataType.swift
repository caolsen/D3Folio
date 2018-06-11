//
//  MockServiceDataTypes.swift
//  D3FolioTests
//
//  Created by Christopher Olsen on 6/10/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

/// Data types for Hero service mocks. Used to configure services
/// to return different data schemas for testing.
///
/// - good: good schema that will decode
/// - bad: bad schema that will fail to decode
/// - empty: empty schema
enum HeroServiceDataType {
  case good
  case bad
  case empty
}

/// Data types for Profile service mocks. Used to configure services
/// to return different data schemas for testing.
///
/// - good: good schema that will decode
/// - bad: bad schema that will fail to decode
/// - empty: empty schema
/// - kills: schema with kill data for Hero model
/// - date: schema with lastUpdated timestamp for Profile model
enum ProfileServiceDataType {
  case good
  case bad
  case empty
  case kills
  case date
}
