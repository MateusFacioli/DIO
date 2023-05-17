//
//  TasksTableViewController.swift
//  DIO-MAPS-TASKS
//
//  Created by Mateus Rodrigues on 21/11/22.
//

import UIKit
let buy = Category(name: "Shopping list", color: .green)
let study = Category(name: "Study", color: .blue)
let tasks: [Task] = [
    Task(name: "Buy books", date: Date(), category: buy),
    Task(name: "study IOS", date: Date(), category: study),
]
class TasksTableViewController: UITableViewController {

    private var dateFormatter: DateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        let task = tasks[indexPath.row]
        dateFormatter.dateFormat = "HH:mm"
        cell.hourLabel.text = dateFormatter.string(from: task.date)
        dateFormatter.dateFormat = "dd/MM/yyyy"
        cell.dateLabel.text = dateFormatter.string(from: task.date)
        
        cell.categoryLabel.text = task.category.name
        cell.taskColorView.backgroundColor = task.category.color
        cell.taskLabel.text = task.name
        
        return cell

        
    }

}
