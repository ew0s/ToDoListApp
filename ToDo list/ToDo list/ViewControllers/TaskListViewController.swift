//
//  ViewController.swift
//  ToDo list
//
//  Created by Егор Савковский on 17.05.2021.
//

import UIKit

class TaskListViewController: UITableViewController {
    
    // MARK: - Private properties
    private var taskList: [Task] = []
    private let cellID = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        fetchData()
    }
}

// MARK: - Private methods
extension TaskListViewController {
    private func fetchData() {
        guard let fetchedData = DatabaseManager.shared.fetchData() as? [Task] else {
            return
        }

        taskList = fetchedData
    }
    
    private func setupViewController() {
        title = "Task List"
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        navigationController?.setupNavigationBar()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewTask)
        )
    }
    
    @objc
    private func addNewTask() {
        
    }
}

// MARK: - UITableViewDataSource
extension TaskListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let task = taskList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = task.title
        cell.contentConfiguration = content

        return cell
    }
}
