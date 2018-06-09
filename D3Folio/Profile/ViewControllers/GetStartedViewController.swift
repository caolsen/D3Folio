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

  /// TextField for entering the alphanumeric portion of a battletag
  @IBOutlet weak var accountNameTextField: UITextField!

  /// TextField for entering the numeric portion of a battletag
  @IBOutlet weak var tagIdTextField: UITextField!

  /// Button to trigger search using the data entered in the text fields
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

    // clear text fields to make it easier to enter subsequent queries
    accountNameTextField.text = ""
    tagIdTextField.text = ""
  }

  // MARK: Navigation

  /// Preps for segues.
  /// Only one segue exists for this controller, ProfileShow, which will
  /// push the profile view onto the nav stack and assign the accountName
  /// and tagId properties for the account query.
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ProfileShow" {
      guard let dc = segue.destination as? ProfileViewController else { return }
      dc.accountName = accountNameTextField.text
      dc.tagId = tagIdTextField.text
    }
  }

  /// Cancels segue if either accountNameTextField or tagIdTextField are nil or empty strings.
  override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    guard let accountName = accountNameTextField.text, let tagId = tagIdTextField.text else { return false }
    guard !accountName.isEmpty && !tagId.isEmpty else { return false }

    return true
  }
}

// MARK: UITextFieldDelegate
extension GetStartedViewController: UITextFieldDelegate {

  /// Return key on the accountNameTextField should move first responser
  /// to the tagIdTextField. The tagIdTextField return key will resign
  /// first responder and execute the search/segue.
  ///
  /// - Parameter textField: accountNameTextField or tagIdTextField
  /// - Returns: true
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    switch textField {
    case accountNameTextField:
      tagIdTextField.becomeFirstResponder()
    default:
      textField.resignFirstResponder()
      performSegue(withIdentifier: "ProfileShow", sender: self)
    }

    return true
  }
}
