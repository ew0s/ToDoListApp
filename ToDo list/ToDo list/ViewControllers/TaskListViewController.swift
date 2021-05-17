//
//  ViewController.swift
//  ToDo list
//
//  Created by Егор Савковский on 17.05.2021.
//

import UIKit

class TaskListViewController: UITableViewController {
    
    // MARK: - Private properties
    private var textData: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let data = DatabaseManager.shared.fetchData()
        print(data.self)
    }
}

