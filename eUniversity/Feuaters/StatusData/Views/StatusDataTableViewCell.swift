//
//  StatusDataTableViewCell.swift
//  eUniversity
//
//  Created by Damir Ramic on 21/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class StatusDataTableViewCell: UITableViewCell {
    @IBOutlet weak var statusDataImageView: UIImageView!
    @IBOutlet weak var statusDataSubtitle: UILabel!
    
    @IBOutlet weak var statusDataLabel: UILabel!
    var studentData = StudentDataController()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCell(cellIndex:Int) {
        
        switch cellIndex {
        case 0:
            statusDataLabel.text = "IndexNumber".localized()
            statusDataSubtitle.text = StudentDataController.sharedController.studentData?.StudentNumber
        case 1:
            statusDataLabel.text = "Author".localized()
            statusDataSubtitle.text = UserController.sharedController.userName
        case 2:
            statusDataLabel.text = "email".localized()
           //statusDataSubtitle.text = UserController.sharedController
        case 3:
            statusDataLabel.text = "EnrollmentYear".localized()
            statusDataSubtitle.text = StudentDataController.sharedController.studentData?.EnrollmentYear
        case 4:
            statusDataLabel.text = "EnrollmentDate".localized()
            statusDataSubtitle.text = StudentDataController.sharedController.studentData?.EnrollmentDate
        case 5:
            statusDataLabel.text = "Faculty".localized()
            statusDataSubtitle.text = StudentDataController.sharedController.studentData?.Faculty
        case 6:
            statusDataLabel.text = "Department".localized()
            statusDataSubtitle.text = StudentDataController.sharedController.studentData?.Department
        case 7:
            statusDataLabel.text = "Curriculum".localized()
           statusDataSubtitle.text = StudentDataController.sharedController.studentData?.Curriculum
        case 8:
            statusDataLabel.text = "StudyYear".localized()
            statusDataSubtitle.text = String(describing: StudentDataController.sharedController.studentData?.StudyYear)
   
        default:
            break
        }
        
    }

}
