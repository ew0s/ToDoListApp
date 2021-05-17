//
//  ExtensionUINavigationController.swift
//  ToDo list
//
//  Created by Егор Савковский on 18.05.2021.
//

import UIKit

extension UINavigationController {
    func setupNavigationBar() {
        
        self.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navBarAppearance.backgroundColor = UIColor(
            red: 17/255,
            green: 96/255,
            blue: 98/255,
            alpha: 1
        )
        
        self.navigationBar.standardAppearance = navBarAppearance
        self.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        self.navigationBar.tintColor = .white
    }
}
