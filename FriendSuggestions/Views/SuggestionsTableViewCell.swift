//
//  SuggestionsTableViewCell.swift
//  FriendSuggestions
//
//  Created by Alex on 11/21/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit
import MessageUI

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
    @IBOutlet weak var exitBtn: UIButton!
    
    // MARK: - Actions
    
    @IBAction func addBtnPressed(_ sender: UIButton) {
        print("Invite suggestion")
        // Code below
        sendText(contact: friendSuggestion!)
    }
    @IBAction func exitBtnPressed(_ sender: UIButton) {
        print("Remove suggestion")
        // Code below
        
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
        
        // Image View
        userImageView.makeCircle()
        
        // Add Button
        addBtn.buttonLayout()
        
        // Intials Label
        if contact.avatar == nil {
            initialsLbl.isHidden = false
            let name = contact.givenName + " " + contact.familyName
            initialsLbl.text = "😁" //name.initials
            initialsLbl.font = UIFont.systemFont(ofSize: 40.0)
        } else {
            initialsLbl.isHidden = true
        }
    }
    
}

extension SuggestionsTableViewCell: MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true)
    }
    
    func sendText(contact: Contacts){
        if MFMessageComposeViewController.canSendText() {
            let controller = MFMessageComposeViewController()
            controller.body = "HELLOOOO"
            controller.recipients = [contact.number]
            controller.messageComposeDelegate = self
            self.parentViewController?.present(controller, animated: true, completion: nil)
        } else {print("Cannot send message. Error.")}
    }
}
