//
//  Profile.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/5/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

/// Representation of a player's Diablo 3 Profile
///
/// NOTE: All of the data contained within the Profile node may be placed in an inactive state if
///       the account has not been used recently. The same is true of individual heroes. Because
///       of this some account may return no data.
struct Profile: Codable {

  /// Player's battle tag. Consists of a alpha-numeric string followed by a '#' and then an integer.
  let battleTag: String

  /// Array of player heroes.
  let heroes: [Hero]?

  /// Timestamp indicating the last time the profile was updated via Battle.net
  let lastUpdated: Double?

  /// Struct containing counts of the various enemies a player has defeated.
  let kills: DefeatedEnemies?
}

