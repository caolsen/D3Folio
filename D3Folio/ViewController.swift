//
//  ViewController.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/5/18.
//  Copyright © 2018 caolsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var viewModel: ProfileViewModel!

  override func viewDidLoad() {
    super.viewDidLoad()

    viewModel = ProfileViewModel()

    // TODO: setup observation of the viewModel to refresh the view

    viewModel.getProfile()
  }
}

