//
//  ViewController.swift
//  FriendSuggestions
//
//  Created by Alex on 11/21/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let contactsController = ContactsController()
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        print(contactsController.contacts.count, contactsController.imageContacts.count)
    }


    
}

