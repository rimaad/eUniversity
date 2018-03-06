//
//  SemesterDetailTableViewCell.swift
//  eUniversity
//
//  Created by Damir Ramic on 05/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class SemesterDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var semesterDetailImageView: UIImageView!
    @IBOutlet weak var semesterDetailValue: UILabel!
    @IBOutlet weak var semesterDetailTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCell(index:Int){
        switch index {
        case 0:
        semesterDetailImageView.image = #imageLiteral(resourceName: "year_enrollment")
        semesterDetailValue.text = SemesterController.sharedController.semesterData?.Semesters[0].AcademicYear
        semesterDetailTitle.text = "Academic Year"
        
        case 1:
            semesterDetailImageView.image = #imageLiteral(resourceName: "curiculum")
            semesterDetailValue.text = SemesterController.sharedController.semesterData?.Semesters[0].Curriculum
            semesterDetailTitle.text = "Curiculum"
        
        case 2:
            semesterDetailImageView.image = #imageLiteral(resourceName: "study_year_icon")
            semesterDetailValue.text = SemesterController.sharedController.semesterData?.Semesters[0].SemesterDescription
            semesterDetailTitle.text = "Study year / semestar"
        
        case 3:
            semesterDetailImageView.image = #imageLiteral(resourceName: "date_icon")
            semesterDetailValue.text = SemesterController.sharedController.semesterData?.Semesters[0].SemesterDate
            semesterDetailTitle.text = "Enrollment date"
        
        case 4:
            semesterDetailImageView.image = #imageLiteral(resourceName: "broj_upisa")
            semesterDetailValue.text = "\(SemesterController.sharedController.semesterData?.Semesters[0].SemesterCount ?? 0)"
            semesterDetailTitle.text = "Number of enteries"
        
        case 5:
            semesterDetailImageView.image = #imageLiteral(resourceName: "status_student")
            if SemesterController.sharedController.semesterData?.Semesters[0].Status == 1 {
                semesterDetailValue.text = "Active"
                
            } else {
                semesterDetailValue.text = "In Active"
            }
            semesterDetailTitle.text = "Status"
        
        case 6:
            semesterDetailImageView.image = #imageLiteral(resourceName: "study_type")
            semesterDetailValue.text = SemesterController.sharedController.semesterData?.Semesters[0].StudyType
            semesterDetailTitle.text = "Study type"
        default:
        break
        }
    }

}
