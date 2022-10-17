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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    

}
