//
//  MainTestTableViewController.swift
//  FriendSuggestions
//
//  Created by Alex on 11/22/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class MainTestTableViewController: UITableViewController {

    // MARK: - Properties
    
    let dataSource: [Feed] = [Feed(contact: "yes contact cell", ad: nil), Feed(contact: nil, ad: "yes ad"), Feed(contact: "yes contact cell", ad: nil)]
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Running")
        tableView.tableFooterView = UIView()
    }

    // MARK: - Insert
    
    private func insertArray(){
        
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = dataSource[indexPath.row]
        
        if let _ = item.contact {
            let cell = Bundle.main.loadNibNamed("InsertionTableViewCell", owner: self, options: nil)?.first as! InsertionTableViewCell
            return cell
        } else if let _ = item.ad {
            let inviteAFewCell = Bundle.main.loadNibNamed("InviteAFewFriendsTableViewCell", owner: self, options: nil)?.first as! InviteAFewFriendsTableViewCell
            inviteAFewCell.addFriendBtn.addTarget(self, action: #selector(invitePressed(sender:)), for: .touchDown)
            return inviteAFewCell
        } else {
            let cell = Bundle.main.loadNibNamed("InsertionTableViewCell", owner: self, options: nil)?.first as! InsertionTableViewCell

            return cell
        }
    }

    @objc func invitePressed(sender: UIButton){
        print("HERE invite pressed")
        performSegue(withIdentifier: "GIFSegue", sender: self)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = dataSource[indexPath.row]

        if let _ = item.contact {
            return 232
        } else if let _ = item.ad {
            return 200
        } else {
            return 232
        }
    }
}
