//
//  File.swift
//  ToDoList
//
//  Created by rajman on 8/22/23.
//  Copyright © 2023 rajman. All rights reserved.
//

import Foundation
import UIKit

enum Category{
    case shopping
    case study
    case work
    case personal
    
}
struct ToDoItem {
     var title : String
     var subtitle : String
     var date : Data
     var category : Category
    init(fTitle: String, fSubtitle : String , fCategory: Category , fDate : Data){
        self.title = fTitle
        self.subtitle = fSubtitle
        self.date = fDate
        self.category = fCategory
    }
}


class Model {
    
    private var toDoItems : [ToDoItem] = []
    private var mirrorItems : [ToDoItem] = []

    
    
    func getTodoItems() -> [String]{
        let toDoTitle = getAllTitles()
        if mirrorItems.count > 0{
            
            return toDoTitle
        }else{
            
            return toDoTitle
        }
    }
    
    
    func setTodoItems(updateToDo : [ToDoItem]){
        toDoItems = updateToDo
    }
    func getAllTitles() -> [String] {
        return toDoItems.map { $0.title }
    }
    
    func searchItems(searchText: String){
        let toDoTitle = getAllTitles()
        let temp : [String] = toDoTitle.filter({ (item) -> Bool in
            
            return item.contains(searchText)
        })
        //toDoItems = temp
    }
    
    func addingTitle(newTitle : String) -> String {
        return newTitle
    }
    func addingSubtitle(newSubtitle : String) -> String {
        return newSubtitle
    }
    func addingDate(newDate : Data) -> Data {
        return newDate
    }
    func addingCategory(newCategory : Category) -> Category{
        return newCategory
    }
    func addingNewToDo(fTitle: String, fSubtitle : String , fCategory: Category , fDate : Data) -> IndexPath{
        
        let newToDo = ToDoItem(fTitle: fTitle, fSubtitle : fSubtitle , fCategory: fCategory , fDate : fDate)
        toDoItems.append(newToDo)
        let indexPath = IndexPath(row: toDoItems.count - 1, section: 0)
        return indexPath
    }
    
}
