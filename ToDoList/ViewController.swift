//
//  ViewController.swift
//  ToDoList
//
//  Created by rajman on 8/19/23.
//  Copyright © 2023 rajman. All rights reserved.
//

import UIKit


class ViewController: UIViewController{
    
    @IBOutlet weak var tblList: UITableView!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet var main: UIView!
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var searchBtn: UIButton!

    @IBOutlet weak var searchTxtField: UITextField!

    
    var myModel = Model()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tblList.dataSource = self
        tblList.delegate = self
        searchBtn.backgroundColor = UIColor.blue
    }

    @IBAction func addClicked(_ sender: Any) {
        
        guard let text = txtField.text, !text.isEmpty else {
            
            return
        }
        //let indexPath = myModel.appendInToDo(text: Text)
        //tblList.insertRows(at: [indexPath], with: .automatic)
        //txtField.text = ""
        
        
        self.myModel.searchItems(searchText: text)
        self.tblList.reloadData()
    }
    
    @IBAction func onTextChanged(_ sender: UITextField) {
        
    }
    
    @IBAction func didEndEditing(_ sender: UITextField) {
        
        print(sender.text)
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
//        guard !searchText.isEmpty else {
//            myModel.setFilteredItems(updatefiltered: myModel.getTodoItems())
//            tblList.reloadData()
//            print(myModel.getTodoItems())
//            print(myModel.getFilteredItems())
//            return
//        }
//        let temp : [String] = myModel.getTodoItems().filter({ (String) -> Bool in
//            return String.contains(searchText)
//        })
//        myModel.setFilteredItems(updatefiltered: temp)
//        tblList.reloadData()
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
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            var toDoRemove = myModel.getTodoItems()
            toDoRemove.remove(at: indexPath.row)
            myModel.setTodoItems(updateToDo:toDoRemove)
//            filteredItems.remove(at: indexPath.row)
            tblList.deleteRows(at: [indexPath], with: .fade)
//            tableView.reloadData()
        }
    }
}
    


