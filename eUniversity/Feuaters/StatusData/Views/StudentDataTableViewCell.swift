//
//  StudentDataTableViewCell.swift
//  eUniversity
//
//  Created by Damir Ramic on 25/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class StudentDataTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func populateCell(row:Int) {
        if row == 0 {
            let averageGrade = AverageGradesController.sharedController.averageGradesData?.AverageGrades[row].AverageGrade.rounded(toPlaces: 2) ?? 0.00
            titleLabel.text = "Ukupan prosjek/" + " (\(averageGrade))"
            if ((AverageGradesController.sharedController.averageGradesData?.AverageGrades) != nil) { progressBar.setProgress(Float((StudentDataController.sharedController.studentData?.AverageGrade)!)/10, animated: true)
            }
        } else {
        let averageGrade = AverageGradesController.sharedController.averageGradesData?.AverageGrades[row-1].AverageGrade.rounded(toPlaces: 2) ?? 0.00
        titleLabel.text = String(row) + "Year".localized() + " (\(averageGrade))"
        if ((AverageGradesController.sharedController.averageGradesData?.AverageGrades) != nil) { progressBar.setProgress(Float((AverageGradesController.sharedController.averageGradesData?.AverageGrades[row-1].AverageGrade)!)/10, animated: true)
            
            }
        }
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
