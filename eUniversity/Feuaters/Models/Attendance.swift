//
//  Attendance.swift
//  eUniversity
//
//  Created by Damir Ramic on 19/02/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

struct AttendanceValue: Decodable {
   var value : Attendances
}

struct Attendances: Decodable {
    
    var Attendance : [Attendance]
}

struct Attendance : Decodable {
   
    var CourseName : String?
    var EventHours : Int?
    var Percentage : Int?
    var StudentHours:Int?
    var StudentID  : Int?
    var StudyYear  : Int?
    var SyllabusID : Int?
    var TeachingType:Int?
}

