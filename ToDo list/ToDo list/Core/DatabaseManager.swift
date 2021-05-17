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
    
    // MARK: - Private properties
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - Initializers
    private init() {}
    
    // MARK: - Public methods
    func fetchData() -> [Any] {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            return try context.fetch(fetchRequest)
        } catch let error {
            print(error)
        }
        
        return []
    }
    
    func save(taskName: String) {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Task", in: context) else { return }
        guard let _ = NSManagedObject(entity: entityDescription, insertInto: context) as? Task else { return }
        
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
