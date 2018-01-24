//
//  StudentData.swift
//  eUniversity
//
//  Created by Damir Ramic on 21/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

struct ValueStudentData: Decodable {
    let value : StudentData
}

struct StudentData: Decodable {
    
    let AverageGrade : Double?
    let Curriculum   : String?
    let Department   : String?
    let EnrollmentDate : String?
    let EnrollmentYear : String?
    let Faculty        : String?
    let Semester        : Double?
    let StudentID   :Int?
    let StudentNumber : String?
    let StudentStatus : String?
    let StudyType : String?
    let StudyYear : Int?

}

