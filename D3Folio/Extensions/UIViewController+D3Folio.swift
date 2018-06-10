//
//  UIViewController+D3Folio.swift
//  D3Folio
//
//  Created by Christopher Olsen on 6/9/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import UIKit

extension UIViewController {

  /// Shows a simple alertController with one action.
  ///
  /// - Parameters:
  ///   - title: title for the alert controller
  ///   - message: body message for the alert controller
  ///   - action: action closure to execute
  func showAlert(withTitle title: String, message: String, andAction action: ((UIAlertAction) -> Void)? = nil) {

    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: action))
    present(alertController, animated: true)
  }
}
