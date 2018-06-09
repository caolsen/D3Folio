//
//  GetStartedViewController.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/8/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {

  // MARK: IBOutlets

  @IBOutlet weak var accountNameTextField: UITextField!
  @IBOutlet weak var tagIdTextField: UITextField!
  @IBOutlet weak var lookupAccountButton: UIButton!

  // MARK: iOS Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()

    accountNameTextField.delegate = self
    tagIdTextField.delegate = self
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: false)
  }

  // MARK: Navigation

  override func performSegue(withIdentifier identifier: String, sender: Any?) {

  }

  override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    guard let accountName = accountNameTextField.text, let tagId = tagIdTextField.text else { return false }
    guard !accountName.isEmpty && !tagId.isEmpty else { return false }

    return true
  }
}

// MARK: UITextFieldDelegate
extension GetStartedViewController: UITextFieldDelegate {

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    switch textField {
    case accountNameTextField:
      tagIdTextField.becomeFirstResponder()
    default:
      // TODO: search and go to profile
      textField.resignFirstResponder()
    }

    return true
  }
}
