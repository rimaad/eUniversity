//
//  Syllabus.swift
//  eUniversity
//
//  Created by Damir Ramic on 3/19/18.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

struct SyllabusValue: Decodable {
    var value : Syllabuses
}

struct Syllabuses : Decodable {
    var Syllabuses : [Syllabus]
}

struct  Syllabus: Decodable {
    var  CourseName : String?
    var  SyllabusID : Int?
}
