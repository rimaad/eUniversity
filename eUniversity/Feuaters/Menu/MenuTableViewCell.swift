//
//  MenuTableViewCell.swift
//  eUniversity
//
//  Created by Damir Ramic on 06/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func populateCell(indexPath:Int) {
        
        switch indexPath {
        case 0:
            titleLabel.text = "attendances".localized()
            ImageView.image = #imageLiteral(resourceName: "attendances")
        case 1:
            titleLabel.text = "payments".localized()
            ImageView.image = #imageLiteral(resourceName: "icon_payment")
        case 2:
            titleLabel.text = "exam_terms".localized()
            ImageView.image = #imageLiteral(resourceName: "icon_exams")
        case 3:
            titleLabel.text = "certificates".localized()
            //CertificateController.sharedController.getCertificates(academicYear:false,academicYearId:"")
            ImageView.image = #imageLiteral(resourceName: "icon_certificate")
        case 4:
            titleLabel.text = "logout".localized()
            ImageView.image = #imageLiteral(resourceName: "icon_sign_out")
        default:
            break
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
