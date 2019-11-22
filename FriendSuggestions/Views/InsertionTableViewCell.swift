//
//  InsertionTableViewCell.swift
//  FriendSuggestions
//
//  Created by Alex on 11/22/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class InsertionTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    let contactsController = ContactsController()
    
    let cellHeight: CGFloat = 70.0
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - VC Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.dataSource = self
        tableView.delegate = self
        
        print(contactsController.contacts.count, contactsController.imageContacts.count)
    }
    
}
extension InsertionTableViewCell: UITableViewDelegate {
    
}

extension InsertionTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let contactCount = contactsController.imageContacts.count
        
        // We only want to display 3 suggestions at a time
        if contactCount >= 3 {
            //tableViewHeightConstraint.constant = 3 * cellHeight // Set height of tableview
            return 3
        } else {
            //tableViewHeightConstraint.constant = CGFloat(contactCount) * cellHeight
            return contactCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("SuggestionsTableViewCell", owner: self, options: nil)?.first as! SuggestionsTableViewCell
        cell.friendSuggestion = contactsController.imageContacts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}


