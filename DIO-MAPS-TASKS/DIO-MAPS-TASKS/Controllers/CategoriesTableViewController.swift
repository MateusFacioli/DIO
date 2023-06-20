//
//  CategoriesTableViewController.swift
//  DIO-MAPS-TASKS
//
//  Created by Mateus Rodrigues on 23/05/23.
//

import UIKit

class CategoriesTableViewController: UITableViewController {

    let categories = CategoryRepository.getCategories()
    //MARK: clousure como variável
    var choosenCategory : ((Category) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseCategoryCell", for: indexPath)
        let category = categories[indexPath.row]
        cell.textLabel?.text = category.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        choosenCategory!(category)
        self.navigationController?.popViewController(animated: true)
    }
}
