//
//  Exams.swift
//  eUniversity
//
//  Created by Damir Ramic on 08/04/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

struct ExamsValue: Decodable {
    var value : ExamTerms
}

struct ExamTerms : Decodable {
    var ExamTerms : [ExamTerm]
}

struct ExamTerm : Decodable {
    var ExamTermID:Int?
    var CourseName:String?
    var DateTime:String?
    var ExamRegistrationStatus:String?
    var Registered :Bool?
    var  Selected :Bool?
    var ExamRegistrationID : Int?
    var CanRegister:Bool?
}
