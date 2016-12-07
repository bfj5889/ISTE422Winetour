//
//  WineTableViewCell.swift
//  winetour
//
//  Created by Dustin Spitz on 12/7/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class WineTableViewCell: UITableViewCell {
    
    @IBOutlet var modelImagePath : [String]!
    @IBOutlet var modelWineName  : [String]!
    @IBOutlet var modelWineBrand : [String]!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
