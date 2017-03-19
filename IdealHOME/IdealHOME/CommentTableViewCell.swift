//
//  CommentTableViewCell.swift
//  IdealHOME
//
//  Created by Zhan Dong on 3/18/17.
//  Copyright © 2017 Zhan Dong. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    //MARK: Properties
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
