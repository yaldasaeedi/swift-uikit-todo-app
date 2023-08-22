//
//  File.swift
//  ToDoList
//
//  Created by rajman on 8/22/23.
//  Copyright © 2023 rajman. All rights reserved.
//

import Foundation

class Model {
    
    private var todoItems : [String] = ["Hiiii", "hi", "Yalda", "Hoorad", "Saeed", "Hoshang"]
    
    private var mirorItems : [String] = []
    
    func getTodoItems() -> [String]{
        
        if mirorItems.count > 0{
            return mirorItems
        }else{
            return todoItems
        }
    }
    
    
    func setTodoItems(updateToDo : [String]){
        todoItems = updateToDo
    }
    
    func searchItems(searchText: String){
        
        let temp : [String] = todoItems.filter({ (item) -> Bool in
            
            return item.contains(searchText)
        })
        mirorItems = temp
    }
    

    func appendInToDo(text : String) -> IndexPath{
        
        todoItems.append(text)
        let indexPath = IndexPath(row: todoItems.count - 1, section: 0)
        return indexPath
    }
    
    
    //    var getToDo : [String] {
    //
    //        get{
    //
    //            return todoItems
    //        }
    //    }
    //
    //    var getSetFiltered : [String] {
    //
    //        get{
    //            return filteredItems
    //        }set{
    //            
    //        }
    //        
    //    }


}
