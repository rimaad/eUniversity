//
//  PaymentsTableViewCell.swift
//  eUniversity
//
//  Created by Damir Ramic on 14/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class PaymentsTableViewCell: UITableViewCell {

    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var yearOfStudy: UILabel!
    @IBOutlet weak var academicYear: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var paymentTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateCell(payment:Payment) {
        amountLabel.text = "\(payment.Amount ?? 0)" + " KM"
        academicYear.text = payment.AcademicYear
        yearOfStudy.text = "\(payment.StudyYear ?? 0)" + "year".localized()
        paymentTitle.text = payment.PaymentType
        dateLabel.text = payment.Date
    }

}
