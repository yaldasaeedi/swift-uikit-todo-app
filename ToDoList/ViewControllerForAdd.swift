//
//  ViewControllerForAdd.swift
//  ToDoList
//
//  Created by rajman on 8/23/23.
//  Copyright © 2023 rajman. All rights reserved.
//

import UIKit


class ViewControllerForAdd: UIViewController{
    
    @IBOutlet weak var titleTf: UITextField!
    @IBOutlet weak var subtitleTf: UITextField!
    @IBOutlet weak var titleBtn: UIButton!
    @IBOutlet weak var subtitleBtn: UIButton!
    @IBOutlet weak var dateBtn: UIButton!
    @IBOutlet weak var categoryBtn: UIButton!
    @IBOutlet weak var dateDp: UIDatePicker!
    @IBOutlet weak var categoryPv: UIPickerView!
    @IBOutlet weak var addBtn: UIButton!
    
    var myTitle : String = ""
    var mySubtitle : String = ""
    var myDate = Date()
    var myCategory = Category.self // check it
    let  mainStoryBoard : self.storybord // check it
    
    @IBAction func titleClicked(_ sender: Any) {
        guard let text = titleTf.text, !text.isEmpty else {
            
            return
        }
        mainStoryBoard.title = text
    }
    
    @IBAction func subtitleClicked(_ sender: Any) {
        guard let text = subtitleTf.text, !text.isEmpty else {
            
            return
        }
        mainStoryBoard.subtitle = text
    }
    
    @IBAction func dateClicked(_ sender: Any) {
        dateBtn.isHidden = false
        dateBtn.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        dateBtn.becomeFirstResponder()
    }
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        myDate = sender.date
        dateBtn.isHidden = true
    }
  
   /* @IBAction func finalAdd(_ sender: Any) {
        var myToDo = ToDoItem()
    }*/
    
        
}






