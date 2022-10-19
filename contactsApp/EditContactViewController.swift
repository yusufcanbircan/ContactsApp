//
//  EditContactViewController.swift
//  contactsApp
//
//  Created by Yusuf Can Bircan on 17.10.2022.
//

import UIKit

class EditContactViewController: UIViewController {
    
    let context = appDelegate.persistentContainer.viewContext
    
    @IBOutlet weak var editNameTextField: UITextField!
    @IBOutlet weak var editSurnameTextLabel: UITextField!
    @IBOutlet weak var editCompanyTextLabel: UITextField!
    @IBOutlet weak var editNumberTextField: UITextField!
    @IBOutlet weak var editEmailTextField: UITextField!
    
    var person:Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let person {
            editNameTextField.text = person.person_name
            editEmailTextField.text = person.person_email
            editNumberTextField.text = person.person_number
            editCompanyTextLabel.text = person.person_company
            editSurnameTextLabel.text = person.person_surname
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        if let name = editNameTextField.text,
           let surname = editSurnameTextLabel.text,
           let company = editCompanyTextLabel.text,
           let number = editNumberTextField.text,
           let email = editEmailTextField.text {
            
            person?.person_name = name
            person?.person_surname = surname
            person?.person_company = company
            person?.person_number = number
            person?.person_email = email
            
            appDelegate.saveContext()
            
            savedContactAlert()
        }
    }
    
    func savedContactAlert() {
        
        let alertController = UIAlertController(title: "Success", message: "New Contact Added", preferredStyle: .alert)
        
        let okeyAction = UIAlertAction(title: "Okey", style: .default) { action in
            self.navigationController?.popViewController(animated: true)
        }
        
        alertController.addAction(okeyAction)
        
        self.present(alertController, animated: false)
        
    }
}
