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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func editButtonTapped(_ sender: Any) {
    }
    
    @IBAction func messageButtonTapped(_ sender: Any) {
    }
    
    @IBAction func callButtonTapped(_ sender: Any) {
    }
    
    @IBAction func emailButtonTapped(_ sender: Any) {
    }
    
}
