//
//  Semestar.swift
//  eUniversity
//
//  Created by Damir Ramic on 2/8/18.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

struct SemestarValue: Decodable {
  var  value : Semesters
}

struct Semesters: Decodable {
    var  Semesters : [Semester]
}

struct Semester : Decodable {
    var AcademicYear: String?
    var Curriculum: String?
    var Semester :  Int?
    var SemesterCount : Int?
    var SemesterDate:String?
    var SemesterDescription:String?
    var SemesterID: Int?
    var Status: Int?
    var StudyType: String?
    var StudyYear: Int?
    var VerifiedDate:String?
}
