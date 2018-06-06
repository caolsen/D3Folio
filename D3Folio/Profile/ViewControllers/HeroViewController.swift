//
//  HeroViewController.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/6/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import UIKit

class HeroViewController: UIViewController {

  // MARK: IBOutlets

  @IBOutlet weak var nameLabel: UILabel!

  // MARK: Instance Properties

  var battleTag: String?
  var hero: Hero?

  // MARK: iOS Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    nameLabel.text = hero?.name
  }
}
