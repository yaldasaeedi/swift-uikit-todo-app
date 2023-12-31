//
//  ViewController.swift
//  ToDoList
//
//  Created by rajman on 8/19/23.
//  Copyright © 2023 rajman. All rights reserved.
//

import UIKit


class ViewController: UIViewController{
    
    @IBOutlet var main: UIView!
    @IBOutlet weak var tblList: UITableView!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var searchTxtField: UITextField!
    
    var myModel = Model()
    var title = ""
    var subtitle = ""
    var category : Model.Category 
    var date : Date 
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tblList.dataSource = self
        tblList.delegate = self
    }

    @IBAction func searchClicked(_ sender: Any) {
        
        guard let text = searchTxtField.text, !text.isEmpty else {
            
            return
        }
        self.myModel.searchItems(searchText: text)
        self.tblList.reloadData()

    }
    @IBAction func addNewItem(_ sender: Any) {
        let addVC = ViewControllerForAdd()
        addVC.delegate = self 
        present(addVC, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView:UITableView) -> Int{
        
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int{
        
        return myModel.getTodoItems().count
    }
    
    //sets the table cells text
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel!.text = myModel.getTodoItems()[indexPath.row]
        return cell
}
    
    
    /*func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            var toDoRemove = myModel.getTodoItems()
            toDoRemove.remove(at: indexPath.row)
            myModel.setTodoItems(updateToDo:toDoRemove)
//            filteredItems.remove(at: indexPath.row)
            tblList.deleteRows(at: [indexPath], with: .fade)
//            tableView.reloadData()
        }
    }
    */
}
    
extension ViewController: ViewControllerForAddDelegate {
    func didAddNewItem(title: String, subtitle: String, date: Date, category: Model.Category) {
        let newToDo = ToDoItem(title: title, subtitle: subtitle, date: date, category: category)
        myModel.addTodoItem(newToDo)
        tblList.reloadData()
    }
}

