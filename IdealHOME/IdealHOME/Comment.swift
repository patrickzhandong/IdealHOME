//
//  Comment.swift
//  IdealHOME
//
//  Created by Zhan Dong on 3/18/17.
//  Copyright © 2017 Zhan Dong. All rights reserved.
//

import UIKit

class Comment {
    
    //MARK: Properties
    
    var title: String
    var photo: UIImage?
    var comment: String
    var username:String
    
    init?(title: String, photo: UIImage?, comment: String, username:String) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        if title.isEmpty  {
            return nil
        }
        
        // Initialize stored properties.
        self.title = title
        self.photo = photo
        self.comment = comment
        self.username = username
        
    }
    
}
