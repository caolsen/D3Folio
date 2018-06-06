//
//  ProfileViewController.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/6/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!

  private let heroCellReuseIdentifier = "HeroCell"
  
  var viewModel: ProfileViewModel!

  override func viewDidLoad() {
    super.viewDidLoad()

    registerTableViewCells()

    viewModel = ProfileViewModel()
    viewModel.getProfile {
      self.tableView.reloadData()
    }
  }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

  private func registerTableViewCells() {
    tableView.register(UINib(nibName: "HeroTableViewCell", bundle: nil), forCellReuseIdentifier: heroCellReuseIdentifier)
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    guard let numberOfRows = viewModel.profile?.heroes.count else {
      return 0
    }

    return numberOfRows
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    guard let cell = tableView.dequeueReusableCell(withIdentifier: heroCellReuseIdentifier) as? HeroTableViewCell else {
      return UITableViewCell()
    }

    guard let hero = viewModel.profile?.heroes[indexPath.row] else {
      return UITableViewCell()
    }

    cell.setup(with: hero)
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44.0
  }
}
