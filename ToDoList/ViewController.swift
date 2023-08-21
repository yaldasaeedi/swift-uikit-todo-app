//
//  ViewController.swift
//  ToDoList
//
//  Created by rajman on 8/19/23.
//  Copyright © 2023 rajman. All rights reserved.
//

import UIKit


class ViewController: UIViewController{
    
    //outlet
    

    @IBOutlet weak var tblList: UITableView!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet var main: UIView!
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var searchBar: UITableView!
    
    var test : [String] = []
    var search : [String] = []
//function

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tblList.dataSource = self
        tblList.delegate = self
        searchBar.delegate = self

        main.backgroundColor = .black
        search = test
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
        let indexPath = IndexPath(row: test.count - 1, section: 0)
        tblList.insertRows(at: [indexPath], with: .automatic)
        txtField.text = ""
    }
}
extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else{
            search = test
            tblList.reloadData()
            return
        }
        search = test.filter({(String) -> Bool in
        return String.contains(searchText)})
        tblList.reloadData()
    }
}
extension ViewController : UITableViewDelegate, UITableViewDataSource{
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
            tblList.deleteRows(at: [indexPath], with: .fade)
            //tableView.reloadData()
        }
    }
}
    


