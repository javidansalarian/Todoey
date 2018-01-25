//
//  ViewController.swift
//  Todoey
//
//  Created by javidan salarian on 2018-01-23.
//  Copyright © 2018 javidan salarian. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemList = ["a","b","c"]
    var alertTextField: UITextField?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    //MARK: TableView Datasource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell", for: indexPath)
        let cellColor = UIColor.brown
        cell.backgroundColor = cellColor
        cell.textLabel?.text = itemList[indexPath.row]
        return cell
 
    }
    
    //MARK: TableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemList[indexPath.row])

        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
      tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }

    @IBAction func addButtonPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            
            // What will happen once the user clicks the Add Item button on our UIAlert
            if let newItemText = self.alertTextField!.text,
                self.alertTextField?.text != ""  {
                
                self.itemList.append(newItemText)
                self.tableView.reloadData()
            }
        }
        alert.addAction(action)
        alert.addTextField { textField in
            self.alertTextField = textField
            textField.placeholder = "Create new item"
        }
        present(alert, animated: true, completion: nil)
    }
}

