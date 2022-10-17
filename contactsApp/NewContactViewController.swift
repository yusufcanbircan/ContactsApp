//
//  NewContactViewController.swift
//  contactsApp
//
//  Created by Yusuf Can Bircan on 17.10.2022.
//

import UIKit

class NewContactViewController: UIViewController {
    
    let context = appDelegate.persistentContainer.viewContext
    
    @IBOutlet weak var addNameTextLabel: UITextField!
    @IBOutlet weak var addSurnameTextLabel: UITextField!
    @IBOutlet weak var addCompanyTextField: UITextField!
    @IBOutlet weak var addNumberTextField: UITextField!
    @IBOutlet weak var addEmailTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        if let name = addNameTextLabel.text,
           let surname = addSurnameTextLabel.text,
           let number = addNumberTextField.text,
           let company = addCompanyTextField.text,
           let email = addEmailTextField.text {
            
            let person = Contact(context: context)
            
            person.person_name = name
            person.person_surname = surname
            person.person_number = number
            person.person_company = company
            person.person_email = email
            
            appDelegate.saveContext()
        }
    }
}
