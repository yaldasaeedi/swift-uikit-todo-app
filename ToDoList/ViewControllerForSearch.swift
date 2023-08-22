//
//  ViewControllerForSearch.swift
//  ToDoList
//
//  Created by rajman on 8/22/23.
//  Copyright © 2023 rajman. All rights reserved.
//

//import Foundation
import UIKit

class ViewControllerForSearch: UIViewController{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tblListForSearch: UITableView!
    
    var myModel: Model =  Model()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tblListForSearch.dataSource = self
        tblListForSearch.delegate = self
        searchBar.delegate = self
    }
}

extension ViewControllerForSearch: UISearchBarDelegate {
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            print(1)
        guard !searchText.isEmpty else {
            //myModel.setFilteredItems(updatefiltered: myModel.getTodoItems())
            tblListForSearch.reloadData()
            print(myModel.getTodoItems())
            //print(myModel.getFilteredItems())
            return
        }
        let temp : [String] = myModel.getTodoItems().filter({ (String) -> Bool in
            return String.contains(searchText)
            
        })
        //myModel.setFilteredItems(updatefiltered: temp)
        print(4)
        tblListForSearch.reloadData()
    }
}

extension ViewControllerForSearch: UITableViewDelegate, UITableViewDataSource{
        
    func numberOfSections(in tableView:UITableView) -> Int{
            print(5)
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int{
            print(6)
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell{
        print(7)
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell2", for: indexPath)
        
          //  cell.textLabel!.text = myModel.getFilteredItems()[indexPath.row]
        print(8)
        return cell
    }
}
    
