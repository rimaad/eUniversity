//
//  ReminderTableViewCell.swift
//  eUniversity
//
//  Created by Damir Ramic on 07/04/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class ReminderTableViewCell: UITableViewCell {
    @IBOutlet weak var reminderTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
