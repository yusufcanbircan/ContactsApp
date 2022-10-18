//
//  ViewController.swift
//  contactsApp
//
//  Created by Yusuf Can Bircan on 15.10.2022.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

class ViewController: UIViewController {
    
    let context = appDelegate.persistentContainer.viewContext
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var contactsTableView: UITableView!
    
    var contacts:[Contact] = [Contact]()
    
    var isSearching:Bool = false
    var searchingText:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // for large title
        title()
        
        // tableView delegate and datasource
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        // search bar delegate
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isSearching {
            fetchFilteredData(searchText: searchingText!)
        } else {
            fetchContacts()
        }
        
        contactsTableView.reloadData()
    }

    @IBAction func addButtonTapped(_ sender: Any) {
    }
    
    // MARK: functions
    
    func title() {
        
        self.navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let person = sender as? Contact
        
        if segue.identifier == "toDetails" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.person = person
        }
    }
    
    func fetchContacts() {
        let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
        
        let sort = NSSortDescriptor(key: #keyPath(Contact.person_name), ascending: true)
        
        fetchRequest.sortDescriptors = [sort]
        
        do {
            contacts = try context.fetch(fetchRequest)
        } catch {
            print("Error while fetching contacts")
        }
    }
    
    func fetchFilteredData(searchText: String) {
        let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "person_name CONTAINS %@", searchText)
        
        do {
            contacts = try context.fetch(fetchRequest)
        } catch {
            print("Fetching Error!")
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactsTableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        
        cell.nameLabel.text = "\(contacts[indexPath.row].person_name!) \(contacts[indexPath.row].person_surname!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetails", sender: contacts[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "delete", handler: {(contextualAction, view, boolValue) in
            let person = self.contacts[indexPath.row]
            
            self.context.delete(person)
            appDelegate.saveContext()
            
            if self.isSearching {
                self.fetchFilteredData(searchText: self.searchingText!)
            } else {
                self.fetchContacts()
            }
            
            self.contactsTableView.reloadData()
        })
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchingText = searchText
        
        if searchText == "" {
            isSearching = false
            fetchContacts()
        } else {
            isSearching = true
            fetchFilteredData(searchText: searchingText!)
        }
        
        contactsTableView.reloadData()
    }
}

