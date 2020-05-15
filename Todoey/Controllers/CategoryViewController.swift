//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Boedy on 2020/05/15.
//  Copyright © 2020 Boedy. All rights reserved.
//

import UIKit
import CoreData


class CategoryViewController: UITableViewController {
    
    var categories = [Category]()
    let contexts = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }
    
    //MARK: - TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row].name

        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }
    
    //MARK: - Data Manipulation Methods
    
    func saveCategories() {
        
        do {
            try contexts.save()
        } catch {
            print("Error saving Categories\(error)")
        }
        
        self.tableView.reloadData()
    }

    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        
        // let request : NSFetchRequest<Item> = Item.fetchRequest()
        
        do {
            categories = try contexts.fetch(request)
        } catch {
            print("Error fetching Categories\(error)")
        }
        
        tableView.reloadData()
    }
    
    
    
    //MARK: - Add New Catagories
    

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            //what will happend once the user clicks the Add Item button on our UIAlert
            
            // menambah kan data di itemArray
            
            
            let newCategory = Category(context: self.contexts)
            newCategory.name = textField.text!
           // newItem.done = false
            self.categories.append(newCategory)
            
            //menyimpan di aplist file
            
            self.saveCategories()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add a new category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
        
    }
    
    
    //MARK: - TableView Delegate Methods
    

