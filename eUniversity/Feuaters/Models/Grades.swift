//
//  Grades.swift
//  eUniversity
//
//  Created by Damir Ramic on 28/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

struct GradesValue: Decodable {
    var value : StudentGrades
}

struct StudentGrades : Decodable {
    var StudentGrades : [Grade]
}

struct  Grade : Decodable {
   var CourseName: String?
   var ECTS: Int?
   var Grade:Int?
   var GradeDate : String?
    var GradeDescription : String?
    var GradeID : Int?
    var Passed : Int?
    var Semester : Int?
    var StudyYear : Int?
}
