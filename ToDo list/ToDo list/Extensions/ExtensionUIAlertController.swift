//
//  ExtensionUIAlertController.swift
//  ToDo list
//
//  Created by Егор Савковский on 18.05.2021.
//

import UIKit

extension UIAlertController {
    
    func setAlertController(complition: @escaping (String) -> Void) {
        
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            guard let task = self.textFields?.first?.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
                return
            }
            complition(task)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        self.addAction(addAction)
        self.addAction(cancelAction)
        self.addTextField { textField in
            textField.placeholder = "New task"
        }
    }
}
