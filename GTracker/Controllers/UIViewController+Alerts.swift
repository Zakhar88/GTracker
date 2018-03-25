//
//  ExercisesViewController+Alerts.swift
//  GTracker
//
//  Created by 3axap on 25.03.18.
//  Copyright © 2018 3axap. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String?, message: String? = nil) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "Ok", style: .cancel))
        navigationController?.present(alertViewController, animated: true)
    }
}
