//
//  PairTableViewController.swift
//  PairRandomizer
//
//  Created by Caston  Boyd on 6/22/18.
//  Copyright © 2018 Caston  Boyd. All rights reserved.
//

import UIKit

class PairTableViewController: UITableViewController {

    @IBAction func randomButtonTapped(_ sender: Any) {
        
    }
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
     // Extension of class
        CreateAlert()
    }
    
    let tableViewCellID = "nameCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }


    // MARK: - Table view data source
// Based on the number of people per section you will be able to create that section
    // a tableViews is a nested array. 
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return EntityController.sharedController.groups.count 
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Group \(section + 1)"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return EntityController.sharedController.groups[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellID, for: indexPath)
        let name = EntityController.sharedController.groups[indexPath.section][indexPath.row]
        cell.textLabel?.text = name.name
        
        return cell 
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        
            let name = EntityController.sharedController.groups[indexPath.section][indexPath.row]
            EntityController.sharedController.remove(entity: name)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        }
    }
}



extension PairTableViewController {
    
    func CreateAlert() {
    
    let alertController = UIAlertController(title: "Add Name", message: "Name for Grouping", preferredStyle: .alert )
    
    var alertTextField: UITextField?
    
    alertController.addTextField { (textField) in
    alertTextField = textField
    textField.placeholder = "Enter first name..."
    }
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
        
        guard let name = alertTextField?.text, !name.isEmpty else { return }
        
        EntityController.sharedController.add(name: name)
        self.tableView.reloadData()
        
    }
    
    alertController.addAction(cancelAction)
    alertController.addAction(addAction)
    
    self.present(alertController, animated: true, completion: nil)
}
    
}



