//
//  CommentDetailViewController.swift
//  IdealHOME
//
//  Created by Zhan Dong on 3/20/17.
//  Copyright © 2017 Zhan Dong. All rights reserved.
//

import UIKit

class CommentDetailViewController: UIViewController {
    var comment:Comment?
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var itemnameLabel: UILabel!
    @IBOutlet weak var commentView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let comment = comment {
        
            usernameLabel.text = comment.username
            itemnameLabel.text = comment.title
            commentView.text = comment.comment
        }
    }
    
}
