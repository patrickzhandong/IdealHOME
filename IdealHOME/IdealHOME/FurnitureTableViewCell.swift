//
//  FurnitureTableViewCell.swift
//  IdealHOME
//
//  Created by Zhan Dong on 3/11/17.
//  Copyright © 2017 Zhan Dong. All rights reserved.
//

import UIKit

class FurnitureTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var furSize: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
