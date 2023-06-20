//
//  TaskRepository.swift
//  DIO-MAPS-TASKS
//
//  Created by Mateus Rodrigues on 23/05/23.
//

import Foundation
//MARK: Padrao Singleton
class TaskRepository {
    static let instance: TaskRepository = TaskRepository()
    
    var tasks: [Task]
    
    private init() {
        self.tasks = []
    }
    
    func save(task: Task) {
        tasks.append(task)
    }
    
    func update(taskToUpdate: Task) {
        let taskIndex = tasks.firstIndex { (task) -> Bool in
            task.id == taskToUpdate.id
        }
        
        tasks.remove(at: taskIndex!)
        tasks.append(taskToUpdate)
    }
    
    func getTasks() -> [Task] {
        self.tasks
    }
}
