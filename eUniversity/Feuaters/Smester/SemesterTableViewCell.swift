//
//  SemesterTableViewCell.swift
//  eUniversity
//
//  Created by Damir Ramic on 2/8/18.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class SemesterTableViewCell: UITableViewCell {
    @IBOutlet weak var semesterTitleLabel: UILabel!
    
    @IBOutlet weak var verifiedDateLabel: UILabel!
    @IBOutlet weak var verifiedDateLabelTitle: UILabel!
    @IBOutlet weak var enrollmentDateLabel: UILabel!
    @IBOutlet weak var enrollmentDateTitleLabel: UILabel!
    @IBOutlet weak var studyYear: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCell(semester:Semester){
      semesterTitleLabel.text = semester.SemesterDescription!
        studyYear.text = "\((semester.StudyYear ?? 0))"
       enrollmentDateTitleLabel.text = "enrollmentTitleDate".localized()
       enrollmentDateLabel.text = semester.SemesterDate
       verifiedDateLabelTitle.text = "VerifiedDate".localized()
       verifiedDateLabel.text = semester.VerifiedDate
    }
}
