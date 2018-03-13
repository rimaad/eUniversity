//
//  Payments.swift
//  eUniversity
//
//  Created by Damir Ramic on 13/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

struct PaymentsValue: Decodable {
    var value : Payments
}

struct Payments:Decodable {
    var Payments:[Payment]
}

struct Payment:Decodable {
    var AcademicYear : String?
    var AcademicYearID : Int?
    var Amount: Int?
    var Date : String?
    var Note :String?
    var PaymentID: Int?
    var PaymentType: String?
    var StudyYear: Int?
}

