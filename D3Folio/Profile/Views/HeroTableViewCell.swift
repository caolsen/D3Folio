//
//  HeroTableViewCell.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/6/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import UIKit

class HeroTableViewCell: UITableViewCell {

  @IBOutlet weak var portraitImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var levelLabel: UILabel!
  
  func setup(with hero: Hero) {
    nameLabel.text = hero.name
    levelLabel.text = String(hero.level)
  }

  override func awakeFromNib() {
    super.awakeFromNib()

    portraitImageView.layer.cornerRadius = portraitImageView.frame.height / 2
  }
}
