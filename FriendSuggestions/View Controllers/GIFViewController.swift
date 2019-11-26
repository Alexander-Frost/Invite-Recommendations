//
//  GIFViewController.swift
//  FriendSuggestions
//
//  Created by Alex on 11/25/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class GIFViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var gifImageView: UIImageView!
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     setupGif()
    }
    
    // MARK: - Methods
    
    private func setupGif(){
        let gif = UIImage.gif(url: "https://media.giphy.com/media/zI19V0pvL7VbzQymhm/giphy.gif")
        gifImageView.image = gif
    }
}
