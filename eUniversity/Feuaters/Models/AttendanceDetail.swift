//
//  AttendanceDetail.swift
//  eUniversity
//
//  Created by Damir Ramic on 12/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

struct AttendanceDetailValue: Decodable {
  var  value  : AttendancesDetails
}

struct  AttendancesDetails:Decodable {
    var Attendance : [AttendanceDetail]
}

struct  AttendanceDetail:Decodable {
    var  CourseName:String?
    var EventHours :Int?
    var Percentage :Int?
    var StudentHours :Int?
    var StudentID: Int?
    var StudyYear :Int?
    var SyllabusID :Int?
    var TeachingType : String?
}

