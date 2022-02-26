//
//  UIViewController+Utilities.swift
//  Dragon Riders
//
//  Created by Andres Acevedo on 19/02/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentErrorMsg(messageText: String) {
        let alertController = UIAlertController(title: "Error", message: messageText, preferredStyle: .alert)
        let buttonAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(buttonAction)
        present(alertController, animated: true, completion: nil)
    }
}
