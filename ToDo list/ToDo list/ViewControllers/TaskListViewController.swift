//
//  ViewController.swift
//  ToDo list
//
//  Created by Егор Савковский on 17.05.2021.
//

import UIKit

class TaskListViewController: UITableViewController {
    
    // MARK: - Private properties
    private let cellID = "cell"
    private var taskList: [Task] {
        DatabaseManager.shared.taskList
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        fetchData()
    }
}

// MARK: - Private methods
extension TaskListViewController {
    private func fetchData() {
        DatabaseManager.shared.fetchData()
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
    
    @objc private func addNewTask() {
        showAlert { task in
            guard let task = task, !task.isEmpty else { return }
            DatabaseManager.shared.save(taskName: task)
            let cellIndex = IndexPath(row: self.taskList.count - 1, section: 0)
            self.tableView.insertRows(at: [cellIndex], with: .automatic)
        }
    }
}

// MARK: - UITableViewDataSource
extension TaskListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DatabaseManager.shared.taskList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let task =  taskList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = task.title
        cell.contentConfiguration = content

        return cell
    }
}

// MARK: - UIAlertController
extension TaskListViewController {
    private func showAlert(complition: @escaping (String?) -> Void) {
        let alertController = UIAlertController(
            title: "Add Task",
            message: "Enter task name",
            preferredStyle: .alert
        )
        
        alertController.setAlertController { task in
            complition(task)
        }
        
        present(alertController, animated: true)
        
        complition(nil)
    }
}
