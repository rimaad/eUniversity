//
//  GradesTableViewCell.swift
//  eUniversity
//
//  Created by Damir Ramic on 28/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class GradesTableViewCell: UITableViewCell {
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.text = "dateGradeTtile".localized()
        }
    }
    @IBOutlet weak var dateValueLabel: UILabel!
    @IBOutlet weak var semestarLabel: UILabel! {
        didSet {
            semestarLabel.text = "semester".localized()
        }
    }
    @IBOutlet weak var gradeLabel: UILabel! {
        didSet {
            gradeLabel.text = "grade".localized()
        }
    }
    @IBOutlet weak var gradeValueLabel: UILabel!
    @IBOutlet weak var ectsLabel: UILabel! {
        didSet {
            ectsLabel.text = "ECTS"
        }
    }
    @IBOutlet weak var etcsValueLabel: UILabel!
    @IBOutlet weak var semestarValueLabel: UILabel!
    @IBOutlet weak var courseNameValueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func populateCell(grade:Grade){
        
        courseNameLabel.text = grade.CourseName
        dateValueLabel.text = grade.GradeDate
        semestarValueLabel.text = "\(grade.Semester!)"
        etcsValueLabel.text = "\(grade.ECTS!)"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
