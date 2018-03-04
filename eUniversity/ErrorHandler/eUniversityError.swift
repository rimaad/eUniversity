//
//  eUniversityError.swift
//  eUniversity
//
//  Created by Damir Ramic on 2/7/18.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class eUniversityError: Decodable {
    var exceptionCode :Int?
    var exceptionMessage:String?
    var value:String?
}
