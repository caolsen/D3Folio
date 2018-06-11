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

  /// TableView for displaying the list of heroes.
  @IBOutlet weak var tableView: UITableView!

  /// This stack view shows up to 3 views representing the count of enemies the player has defeated.
  @IBOutlet weak var enemyCountStackView: UIStackView!

  /// Label to show the last time the account data was updated.
  @IBOutlet weak var lastUpdatedLabel: UILabel!
  
  /// Indicates activity for loading profile info
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

  // MARK: Private Properties

  // Reuse Identifiers
  private let heroCellReuseIdentifier = "HeroCell"
  private let enemyCountCellReuseIdentifier = "EnemyCountCell"

  /// Hero the user selected from the tableView. Used when passing data via the segue to
  /// the Hero detail view.
  private var selectedHero: Hero?

  // MARK: Instance Properties

  /// alphanumeric portion of a battletag
  var accountName: String?

  /// numeric portion of a battletag
  var tagId: String?

  /// viewModel for populating all the UI elements. Gets created via the ProfileApi.
  /// Will be nil if accountName or tagId are nil.
  var viewModel: ProfileModel? {
    didSet {
      getData()
    }
  }

  // MARK: iOS Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    registerTableViewCells()
    setupViewModel()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: false)
  }

  // MARK: Instance Functions

  /// Creates the viewModel using the ProfileApi. Will fail if accountName or tagId are nil.
  private func setupViewModel() {
    
    guard let accountName = accountName, let tagId = tagId else {
      showAlert(withTitle: "Error", message: "Missing account name.") { (_) in
        self.navigationController?.popViewController(animated: true)
      }

      return
    }

    let api = ProfileApi(route: .profile(account: accountName + "-" + tagId), environment: .production)
    viewModel = ProfileViewModel(api: api)
  }

  /// Asks the viewModel to fetch profile data from the Battle.net endpoint.
  /// - Will fail if the viewModel is nil, so should be called after setupViewModel()
  /// - Reloads tableView and updates other UI elements upon completion
  private func getData() {
    viewModel?.getProfile { (error) in
      if let error = error {
        self.showAlert(withTitle: "Error", message: error.localizedDescription) { (_) in
          self.navigationController?.popViewController(animated: true)
        }
      }

      self.activityIndicator.stopAnimating()
      self.tableView.reloadData()
      self.updateProfileView()
      self.setupEnemyCountStackView()
    }
  }

  /// Creates arranged subviews for the enemyCountStackView.
  private func setupEnemyCountStackView() {
    guard let defeatedEnemies = viewModel?.defeatedEnemies else { return }

    // create one view for each type of defeated enemy
    for monsters in defeatedEnemies {

      let nib = UINib(nibName: "EnemyCountView", bundle: nil)
      if let view = nib.instantiate(withOwner: self, options: nil).first as? EnemyCountView {
        view.setup(enemyCount: monsters.count, enemyType: monsters.title)
        enemyCountStackView.addArrangedSubview(view)
      }
    }
  }

  /// Updates simple UI elements in the "Profile" view shown above the tableView.
  private func updateProfileView() {
    navigationItem.title = viewModel?.profile?.battleTag
    lastUpdatedLabel.text = viewModel?.lastUpdated
  }

  // MARK: Navigation

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ShowHero" {
      guard let dc = segue.destination as? HeroViewController else { return }
      dc.accountName = accountName
      dc.tagId = tagId
      dc.hero = selectedHero
    }
  }
}

// MARK: - UITableViewDelegate and DataSource
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

  private func registerTableViewCells() {
    let nib  = UINib(nibName: "HeroTableViewCell", bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: heroCellReuseIdentifier)
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    guard let numberOfRows = viewModel?.profile?.heroes?.count else {
      return 0
    }

    return numberOfRows
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    guard let cell = tableView.dequeueReusableCell(withIdentifier: heroCellReuseIdentifier) as? HeroTableViewCell else {
      return UITableViewCell()
    }

    guard let hero = viewModel?.profile?.heroes?[indexPath.row] else {
      return UITableViewCell()
    }

    cell.setup(with: hero)
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60.0
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    selectedHero = viewModel?.profile?.heroes?[indexPath.row]
    performSegue(withIdentifier: "ShowHero", sender: self)
    tableView.deselectRow(at: indexPath, animated: false)
  }
}

