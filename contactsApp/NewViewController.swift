//
//  NewViewController.swift
//  contactsApp
//
//  Created by Yusuf Can Bircan on 17.10.2022.
//

import UIKit

class NewViewController: UIViewController {
    
    let context = appDelegate.persistentContainer.viewContext
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        if let name = nameTextField.text,
           let surname = surnameTextField.text,
           let company = companyTextField.text,
           let number = numberTextField.text,
           let email = emailTextField.text {
            
            let person = Contact(context: context)
            
            person.person_name = name
            person.person_surname = surname
            person.person_company = company
            person.person_number = number
            person.person_email = email
            
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
