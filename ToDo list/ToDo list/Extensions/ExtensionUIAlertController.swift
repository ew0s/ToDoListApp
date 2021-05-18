//
//  ExtensionUIAlertController.swift
//  ToDo list
//
//  Created by Егор Савковский on 18.05.2021.
//

import UIKit

extension UIAlertController {
    func setAlertController() {
        
        let addAction = UIAlertAction(title: "Add", style: .default)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        self.addAction(addAction)
        self.addAction(cancelAction)
        self.addTextField { textField in
            textField.placeholder = "New task"
        }
    }
}
