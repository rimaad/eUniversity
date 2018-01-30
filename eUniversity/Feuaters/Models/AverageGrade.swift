//
//  AverageGrade.swift
//  eUniversity
//
//  Created by Damir Ramic on 30/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

struct AverageGradesValue: Decodable {
    var value : AverageGrades
}

struct AverageGrades : Decodable {
   var AverageGrades : [AverageGrade]
}

struct AverageGrade : Decodable {
  var  AverageGrade : Double
    var  StudyYear : Int
}
