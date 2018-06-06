//
//  ProfileViewController.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/6/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

  // MARK: IBOutlets

  @IBOutlet weak var tableView: UITableView!

  // MARK: Private Properties

  private let heroCellReuseIdentifier = "HeroCell"
  private var selectedHero: Hero?

  // MARK: Instance Properties

  var viewModel: ProfileViewModel!

  // MARK: iOS Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    registerTableViewCells()

    let api = ProfileApi(route: .profile(account: "Lyngbakyr-1153"), environment: .production)
    viewModel = ProfileViewModel(api: api)
    getData()
  }

  // MARK: Private Functions

  private func getData() {
    viewModel.getProfile { (error) in
      self.tableView.reloadData()
    }
  }

  // MARK: Navigation

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ShowHero" {
      guard let dc = segue.destination as? HeroViewController else { return }
      dc.battleTag = viewModel.profile?.battleTag
      dc.hero = selectedHero
    }
  }
}

// MARK: - UITableViewDelegate and DataSource
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

  private func registerTableViewCells() {
    tableView.register(UINib(nibName: "HeroTableViewCell", bundle: nil), forCellReuseIdentifier: heroCellReuseIdentifier)
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    guard let numberOfRows = viewModel.profile?.heroes?.count else {
      return 0
    }

    return numberOfRows
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    guard let cell = tableView.dequeueReusableCell(withIdentifier: heroCellReuseIdentifier) as? HeroTableViewCell else {
      return UITableViewCell()
    }

    guard let hero = viewModel.profile?.heroes?[indexPath.row] else {
      return UITableViewCell()
    }

    cell.setup(with: hero)
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60.0
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    selectedHero = viewModel.profile?.heroes?[indexPath.row]
    performSegue(withIdentifier: "ShowHero", sender: self)
    tableView.deselectRow(at: indexPath, animated: false)
  }
}
