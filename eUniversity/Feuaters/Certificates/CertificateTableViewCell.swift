//
//  CertificateTableViewCell.swift
//  eUniversity
//
//  Created by Damir Ramic on 11/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class CertificateTableViewCell: UITableViewCell {
    @IBOutlet weak var certImageView: UIImageView!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var issuedDate: UILabel!
    @IBOutlet weak var createdDate: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCell(indexPath:Int) {
        titleLabel.text = CertificateController.sharedController.certificateData?.Certificates[indexPath].CertificateType ?? ""
        let createdDateValue = CertificateController.sharedController.certificateData?.Certificates[indexPath].CreatedDate ?? ""
        createdDate.text = createdDateValue
        issuedDate.text = CertificateController.sharedController.certificateData?.Certificates[indexPath].IssuedDate ?? ""
        subTitleLabel.text = CertificateController.sharedController.certificateData?.Certificates[indexPath].CertificatePurpose
        certImageView.image = setImage(issued:(CertificateController.sharedController.certificateData?.Certificates[indexPath].Issued)!,active:(CertificateController.sharedController.certificateData?.Certificates[indexPath].Active!)!)
    }
    
    func setImage(issued:Int,active:Int) -> UIImage {
        
        if active == 1 && issued == 0 {
             return #imageLiteral(resourceName: "pending_certificate")
        } else if active == 0 && issued == 1  {
              return #imageLiteral(resourceName: "odobren_icon")
        }
        else {
           return #imageLiteral(resourceName: "neodobren_icon")
        }
    }

}
