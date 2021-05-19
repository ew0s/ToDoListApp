//
//  DatabaseManager.swift
//  ToDo list
//
//  Created by Егор Савковский on 17.05.2021.
//

import UIKit
import CoreData

class DatabaseManager {
    
    // MARK: - Public properties
    static let shared = DatabaseManager()
    public private(set) var taskList: [Task] = []
    
    // MARK: - Private properties
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - Initializers
    private init() {}
    
    // MARK: - Public methods
    func fetchData() {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            try taskList = context.fetch(fetchRequest)
        } catch let error {
            print(error)
        }
    }
    
    func deleteAt(indexPath: IndexPath) {
        context.delete(taskList[indexPath.row])
        taskList.remove(at: indexPath.row)
        saveContext()
    }
    
    func editAt(indexPath: IndexPath, with newTitle: String) {
        taskList[indexPath.row].title = newTitle
        saveContext()
    }
    
    func save(taskName: String) {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Task", in: context) else { return }
        guard let task = NSManagedObject(entity: entityDescription, insertInto: context) as? Task else { return }
        
        task.title = taskName
        taskList.append(task)
        saveContext()
    }
}

// MARK: - Private methods
extension DatabaseManager {
    private func saveContext() {
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
