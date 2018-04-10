//
//  ExamsTableViewCell.swift
//  eUniversity
//
//  Created by Damir Ramic on 07/04/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class ExamsTableViewCell: UITableViewCell {
    @IBOutlet weak var statusColorView: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateOfExam: NSLayoutConstraint!
    @IBOutlet weak var syllabussName: UILabel!
    @IBOutlet weak var segmentedControlExam: UISegmentedControl!
    
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCell(indexPath:Int) {
        statusLabel.text = ExamsController.sharedController.examsData?.ExamTerms[indexPath].ExamRegistrationStatus
        dateLabel.text =  ExamsController.sharedController.examsData?.ExamTerms[indexPath].DateTime
        syllabussName.text = ExamsController.sharedController.examsData?.ExamTerms[indexPath].CourseName
        if ExamsController.sharedController.examsData?.ExamTerms[indexPath].CanRegister ?? false {
             segmentedControlExam.isHidden = false
            if ExamsController.sharedController.examsData?.ExamTerms[indexPath].ExamRegistrationStatus == "Odjavljen" {
                statusColorView.backgroundColor = UIColor.red
                segmentedControlExam.selectedSegmentIndex = 1
            } else if ExamsController.sharedController.examsData?.ExamTerms[indexPath].ExamRegistrationStatus == "Prijavljen" {
                segmentedControlExam.selectedSegmentIndex = 0
                statusColorView.backgroundColor = UIColor.green
            } else {
                segmentedControlExam.selectedSegmentIndex = 1
                statusColorView.backgroundColor = UIColor.red
            }
            
        }else {
            segmentedControlExam.isHidden = true
        }
    }

}
