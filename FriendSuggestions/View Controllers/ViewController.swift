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
        tableView.dataSource = self
        tableView.delegate = self
        
        print(contactsController.contacts.count, contactsController.imageContacts.count)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.tableView.sizeToFit()
        }
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let contactCount = contactsController.imageContacts.count
        
        // We only want to display 3 suggestions at a time
        if contactCount >= 3 {
            return 3
        } else {
            return contactCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("SuggestionsTableViewCell", owner: self, options: nil)?.first as! SuggestionsTableViewCell
        cell.friendSuggestion = contactsController.imageContacts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
