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
        titleLabel.text = String(row+1) + "Year".localized()
        if ((AverageGradesController.sharedController.averageGradesData?.AverageGrades) != nil) { progressBar.setProgress(Float((AverageGradesController.sharedController.averageGradesData?.AverageGrades[row].AverageGrade)!)/10, animated: true)
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
