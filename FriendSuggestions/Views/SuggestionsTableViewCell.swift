//
//  SuggestionsTableViewCell.swift
//  FriendSuggestions
//
//  Created by Alex on 11/21/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class SuggestionsTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    var friendSuggestion: Contacts? {
        didSet {
            if friendSuggestion != nil {
                updateViews(contact: friendSuggestion!)
            }
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var initialsLbl: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var addBtn: UIButton!
    
    // MARK: - Actions
    
    @IBAction func addBtnPressed(_ sender: UIButton) {
        
    }
    
    // MARK: - VC Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Methods
    
    private func updateViews(contact: Contacts){
        setupUI(contact: contact)
        nameLbl.text = contact.givenName + " " + contact.familyName
        userImageView.image = contact.avatar
    }
 
    private func setupUI(contact: Contacts){
        
        // Intials Label
        if contact.avatar == nil {
            initialsLbl.isHidden = false
            let name = contact.givenName + " " + contact.familyName
            initialsLbl.text = name.initials
        } else {
            initialsLbl.isHidden = true
        }
    }
    
}

extension String {
    var initials: String {
        return self.components(separatedBy: " ").filter { !$0.isEmpty }.reduce("") { ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)" }.uppercased()
    }
}
