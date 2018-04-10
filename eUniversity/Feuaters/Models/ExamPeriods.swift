//
//  ExamPeriods.swift
//  eUniversity
//
//  Created by Damir Ramic on 13/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

struct ExamPeriodsValue: Decodable {
    var  value  : ExamPeriods
}

struct  ExamPeriods : Decodable {
   var ExamPeriods:[Exam]
}

struct Exam: Decodable {
    var ExamPeriodID:Int?
    var Name:String?
}
