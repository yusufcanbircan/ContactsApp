//
//  DetailsViewController.swift
//  contactsApp
//
//  Created by Yusuf Can Bircan on 17.10.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let context = appDelegate.persistentContainer.viewContext
    
    @IBOutlet weak var detailsNameLabel: UILabel!
    @IBOutlet weak var detailsPhoneLabel: UILabel!
    @IBOutlet weak var detailsCompanyLabel: UILabel!
    @IBOutlet weak var detailsEmailLabel: UILabel!
    
    var person:Contact?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let person {
            detailsNameLabel.text = "\(person.person_name!) \(person.person_surname!)"
            detailsPhoneLabel.text = person.person_number
            detailsEmailLabel.text = person.person_email
            detailsCompanyLabel.text = person.person_company
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let person = sender as? Contact
        
        if segue.identifier == "toEdit" {
            let destinationVC = segue.destination as! EditContactViewController
            destinationVC.person = person
        }
    }

    @IBAction func editButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toEdit", sender: person!)
    }
    
    @IBAction func messageButtonTapped(_ sender: Any) {
        savedContactAlert(message: "You cannot send a message right now!")
    }
    
    @IBAction func callButtonTapped(_ sender: Any) {
        savedContactAlert(message: "You cannot make a call right now!")
    }
    
    @IBAction func emailButtonTapped(_ sender: Any) {
        savedContactAlert(message: "You cannot send an e-mail right now!")
    }
    
    func savedContactAlert(message: String) {
        
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        
        let okeyAction = UIAlertAction(title: "Okey", style: .default) { action in
            //self.navigationController?.popViewController(animated: true)
        }
        
        alertController.addAction(okeyAction)
        
        self.present(alertController, animated: false)
        
    }
    
}
