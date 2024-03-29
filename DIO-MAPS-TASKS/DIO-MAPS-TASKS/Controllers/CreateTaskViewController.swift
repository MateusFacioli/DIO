//
//  CreateTaskViewController.swift
//  DIO-MAPS-TASKS
//
//  Created by Mateus Rodrigues on 24/11/22.
//

import UIKit

class CreateTaskViewController: UITableViewController, UITextFieldDelegate { 
    
    
    private var datePicker: UIDatePicker = UIDatePicker()
    private var selectedIndexPath: IndexPath?
    private var dateFormatter = DateFormatter()
    private var taskRepository = TaskRepository.instance
    var task: Task = Task()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = .dateAndTime
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        dateFormatter.timeZone =  TimeZone(identifier: "GMT-3")
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "pt_BR")
    }
    
    
    //MARK: OVERRIDE METHODS TABLEVIEW
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Task Name"
        }
        if section == 1 {
            return "Category"
        }
        return "Date and Time"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskDescriptionCell", for: indexPath) as! TaskDescriptionTableViewCell
            cell.taskDescriptionTextField.delegate = self
            return cell
        }
        
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
            cell.textLabel?.text = self.task.category.name
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell", for: indexPath) as! DateTimeTableViewCell
        cell.dateTimeTextField.inputView = datePicker
        cell.dateTimeTextField.delegate = self
        cell.dateTimeTextField.inputAccessoryView = accessoryView()
        return cell
        
        
    }
    
    //MARK: UIView Functions
    
    func accessoryView() -> UIView {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        let barItemSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(selectDate))
        toolbar.setItems([barItemSpace, doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        toolbar.sizeToFit()
        return toolbar
    }
    
    @objc func selectDate() {
        if let indexPath = self.selectedIndexPath {
            let cell = tableView.cellForRow(at: indexPath) as? DateTimeTableViewCell
            if let dateCell = cell {
                dateCell.dateTimeTextField.text =  self.dateFormatter.string(from: datePicker.date)
                self.view.endEditing(true)
                self.task.date = datePicker.date
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    //MARK: UITextFieldDelegate Methods
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let cell = textField.superview?.superview as? DateTimeTableViewCell
        if let dateCell = cell {
            self.selectedIndexPath = tableView.indexPath(for: dateCell)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        self.task.name = textField.text!
    }
    
    //MARK: Action button
    
    @IBAction func tappedSaveButton(_ sender: Any) {
        taskRepository.save(task: task)
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: Segue Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToCategoriesTableViewController" {
            let destination = segue.destination as! CategoriesTableViewController
            destination.choosenCategory = { category in
                self.task.category = category
                self.tableView.reloadData()
            }
        }
    }
    
}

