//
//  ViewController.swift
//  Todoey
//
//  Created by javidan salarian on 2018-01-23.
//  Copyright © 2018 javidan salarian. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    let itemList = ["a","b","c"]
    var selectedNum: Int?
    

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
       // cell.he= 100.0
        let multiplier: Float = Float(255/itemList.count) - Float(itemList.count + indexPath.row)
        print(multiplier)
        let cellColor = UIColor.brown
        cell.backgroundColor = cellColor
            // UIColor(red: 82.0, green: 82.0, blue: 88.0, alpha: 1.0)
        cell.textLabel?.text = itemList[indexPath.row]
        return cell
        
        
        
    }
    
    //MARK: TableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemList[indexPath.row])
     //   print(tableView.cellForRow(at: indexPath)?.accessoryType )

        
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
      tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

        }

//
//        if selectedNum == nil {
//            selectedNum = indexPath.row
//            print("1")
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//
//
//        } else {
//           // tableView.cellForRow(at: indexPath)?.accessoryType = .none
//
//            if selectedNum == indexPath.row {
//            selectedNum = nil
//            print("2")
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//
//        } else {
//            selectedNum = indexPath.row
//            print("1")
//
//            }
//        }
//
        
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    

}

