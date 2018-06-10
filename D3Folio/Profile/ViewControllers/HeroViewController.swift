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

  @IBOutlet weak var portraitImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var levelLabel: UILabel!
  @IBOutlet weak var paragonLevelLabel: UILabel!
  
  @IBOutlet weak var attributesStackView: UIStackView!
  @IBOutlet weak var strengthLabel: UILabel!
  @IBOutlet weak var dexterityLabel: UILabel!
  @IBOutlet weak var vitalityLabel: UILabel!
  @IBOutlet weak var intelligenceLabel: UILabel!
  
  // MARK: Instance Properties

  /// alphanumeric portion of a battletag. Passed from ProfileViewController
  var accountName: String?

  /// numeric portion of a battletag. Passed from ProfileViewController
  var tagId: String?

  /// Hero data. Passed from ProfileViewController
  var hero: Hero!

  /// viewModel for populating all the UI elements. Gets created via the ProfileApi.
  /// Will be nil if accountName or tagId are nil.
  var viewModel: HeroViewModel?

  // MARK: iOS Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    portraitImageView.layer.cornerRadius = portraitImageView.frame.height / 2

    // Hide the attributes view until the request returns. Using alpha so it can
    // be easily animated back in.
    attributesStackView.alpha = 0.0

    setupInitialViews()
    setupViewModel()
    getData()
  }

  // MARK: Instance Functions

  private func setupInitialViews() {
    portraitImageView.image = hero?.portrait
    nameLabel.text = hero?.name
    levelLabel.text = "Level " + String(hero.level)

    if let paragonLevel = hero.paragonLevel {
      paragonLevelLabel.text = "Paragon " + String(paragonLevel)
    }
  }

  /// Creates the viewModel using the ProfileApi. Will fail if accountName, tagId, or hero are nil.
  private func setupViewModel() {
    guard let accountName = accountName,
          let tagId = tagId,
          let heroId = hero?.id else { return }

    let api = ProfileApi(route: .hero(account: accountName + "-" + tagId, hero: String(heroId)), environment: .production)
    viewModel = HeroViewModel(api: api)
  }

  /// Asks the viewModel to fetch hero data from the Battle.net endpoint.
  /// - Will fail if the viewModel is nil, so should be called after setupViewModel()
  /// - Updates other UI elements upon completion
  private func getData() {
    viewModel?.getHero { (error) in
      // TODO: handle error

      self.updateStatsView()
    }
  }

  private func updateStatsView() {
    guard let stats = viewModel?.hero?.stats else { return }

    // TODO: converting these to strings should probably happen in the viewModel
    strengthLabel.text = String(stats.strength)
    dexterityLabel.text = String(stats.dexterity)
    vitalityLabel.text = String(stats.vitality)
    intelligenceLabel.text = String(stats.intelligence)

    UIView.animate(withDuration: 1.0) {
      self.attributesStackView.alpha = 1.0
    }
  }
}
