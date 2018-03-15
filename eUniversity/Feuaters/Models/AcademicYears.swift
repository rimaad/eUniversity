//
//  AcademicYears.swift
//  eUniversity
//
//  Created by Damir Ramic on 15/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

struct AcademicYearValues: Decodable {
    var value:AcademicYears
}

struct AcademicYears: Decodable {
    var AcademicYears : [AcademicYear]
}

struct  AcademicYear:Decodable {
    var AcademicYear :String?
    var AcademicYearID:Int?
}
