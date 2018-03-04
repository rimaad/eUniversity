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
            statusDataLabel.text = UserController.sharedController.userName
            statusDataSubtitle.text = "IndexNumber".localized() + (StudentDataController.sharedController.studentData?.StudentNumber ?? "")
            statusDataImageView.image = #imageLiteral(resourceName: "personal_info")

        case 1:
            statusDataSubtitle.text = "EnrollmentYear".localized()
            statusDataLabel.text = StudentDataController.sharedController.studentData?.EnrollmentYear
            statusDataImageView.image = #imageLiteral(resourceName: "year_enrollment")
       // case 2:
        //    statusDataLabel.text = "email".localized()
           //statusDataSubtitle.text = UserController.sharedController
        case 2:
            statusDataLabel.text = "EnrollmentDate".localized()
            statusDataSubtitle.text = StudentDataController.sharedController.studentData?.EnrollmentDate
            statusDataImageView.image = #imageLiteral(resourceName: "date_icon")
        case 3:
            statusDataLabel.text = "Faculty".localized()
            statusDataSubtitle.text = StudentDataController.sharedController.studentData?.Faculty
            statusDataImageView.image = #imageLiteral(resourceName: "faculty_icon")
        case 4:
            statusDataLabel.text = "Department".localized()
            statusDataSubtitle.text = StudentDataController.sharedController.studentData?.Department
            statusDataImageView.image = #imageLiteral(resourceName: "department")
            
        case 5:
            statusDataLabel.text = "Curriculum".localized()
            statusDataSubtitle.text = StudentDataController.sharedController.studentData?.Curriculum
            statusDataImageView.image = #imageLiteral(resourceName: "curiculum")
            
        case 6:
            statusDataLabel.text = "StudyYear".localized()
            let semester = "/" + "\(StudentDataController.sharedController.studentData?.Semester ?? 0)"
            statusDataSubtitle.text = String(describing:(StudentDataController.sharedController.studentData?.StudyYear ?? 0)) + semester
            statusDataImageView.image = #imageLiteral(resourceName: "study_year_icon")
        case 7:
            statusDataLabel.text = StudentDataController.sharedController.studentData?.StudyType
            statusDataSubtitle.text = "StudyType".localized()
            statusDataImageView.image = #imageLiteral(resourceName: "study_type")
            
        case 8 :
            statusDataLabel.text = StudentDataController.sharedController.studentData?.StudentStatus
            statusDataSubtitle.text = "StudentStatus".localized()
            statusDataImageView.image = #imageLiteral(resourceName: "status_student")
        default:
            break
        }
        
    }

}
