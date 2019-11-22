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
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
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
            tableViewHeightConstraint.constant = 3 * cellHeight // Set height of tableview
            return 3
        } else {
            tableViewHeightConstraint.constant = CGFloat(contactCount) * cellHeight
            return contactCount
        }
    }
    
    @objc func hideRow(sender: UIButton){
        print("Hiding row")
        
        let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
        guard let currentIndex = tableView.indexPathForRow(at: buttonPosition) else {return}
        
//        tableView.deleteRows(at: [currentIndex], with: UITableView.RowAnimation.automatic)
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("SuggestionsTableViewCell", owner: self, options: nil)?.first as! SuggestionsTableViewCell
        cell.friendSuggestion = contactsController.imageContacts[indexPath.row]
        cell.exitBtn.addTarget(self, action: #selector(hideRow(sender:)), for: .touchDown)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


