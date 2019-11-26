//
//  InviteAFewFriendsTableViewCell.swift
//  FriendSuggestions
//
//  Created by Alex on 11/25/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class InviteAFewFriendsTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var addFriendBtn: UIButton!
    @IBOutlet weak var skipBtn: UIButton!
    
    // MARK: - Actions
    
    @IBAction func addFriendBtnPressed(_ sender: UIButton) {
        
    }
    @IBAction func skipBtnPressed(_ sender: UIButton) {
        
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addFriendBtn.addBorder(color: #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1))
    }
    
}

extension UIView {
    func addBorder(color: CGColor, border width: CGFloat = 3.0, on: Bool = true){
        if on {
            self.layer.borderWidth = width
            self.layer.borderColor = color
        } else {
            self.layer.borderWidth = 0
        }
    }
    
}
