//
//  AttendanceTableViewCell.swift
//  eUniversity
//
//  Created by Damir Ramic on 19/02/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class AttendanceTableViewCell: UITableViewCell {

    @IBOutlet weak var attendanceLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var courseTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCell(attendance:Attendance){
        courseTitleLabel.text = attendance.CourseName
        let precentageValue = Float(attendance.Percentage ?? 0) / 100
        progressBar.setProgress(precentageValue, animated: false)
        //let eventHours = "\(attendance.EventHours ?? 0)"
        let studentHours = "\(attendance.Percentage ?? 0)"
        attendanceLabel.text = studentHours + "%"
    }

}
