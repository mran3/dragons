//
//  UIViewController+Alert.swift
//  Dragon Riders
//
//  Created by Andres Acevedo on 10/01/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import UIKit

extension UIViewController {
    func simpleAlert(message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(buttonAction)
        present(alertController, animated: true, completion: nil)
    }
}
