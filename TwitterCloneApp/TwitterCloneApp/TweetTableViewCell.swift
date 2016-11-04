//
//  TweetTableViewCell.swift
//  TwitterCloneApp
//
//  Created by rem{e}koh on 11/4/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var userNameLabel: UILabel!

    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
