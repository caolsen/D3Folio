//
//  EnemyCountView.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/8/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import UIKit

class EnemyCountView: UIView {

  @IBOutlet weak var enemyCountLabel: UILabel!
  @IBOutlet weak var enemyTypeLabel: UILabel!

  func setup(enemyCount: String, enemyType: String) {
    enemyCountLabel.text = enemyCount
    enemyTypeLabel.text = enemyType
  }
}
