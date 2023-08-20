//
//  ViewController.swift
//  ToDoList
//
//  Created by rajman on 8/19/23.
//  Copyright © 2023 rajman. All rights reserved.
//

import UIKit


class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    //outlet
    

    @IBOutlet weak var tblList: UITableView!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet var main: UIView!
    @IBOutlet weak var txtField: UITextField!
    var test : [String] = ["hi"]
//function

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tblList.dataSource = self
        tblList.delegate = self
        main.backgroundColor = .black
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addClicked(_ sender: Any) {
        guard let text = txtField.text, !text.isEmpty else {
            return // Exit if the text field is empty
        }
        
        test.append(text)
        tblList.reloadData()
        txtField.text = ""
    }
    
    func numberOfSections(in tableView:UITableView) -> Int{
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int{
        return test.count
    }
    //sets the table cells text
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel!.text = test[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            test.remove(at: indexPath.row)
            tableView.reloadData() // Refresh the table view after removing the element
        }
    }

    

}
