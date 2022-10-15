//
//  ViewController.swift
//  contactsApp
//
//  Created by Yusuf Can Bircan on 15.10.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // for large title
        title()
    }
    
    func title() {
        
        self.navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }


}

