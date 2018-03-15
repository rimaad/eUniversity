//
//  AcademicYears.swift
//  eUniversity
//
//  Created by Damir Ramic on 15/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class AcademicYearsController: NSObject {
    static let sharedController = AcademicYearsController()
    var academicYearsData  :  AcademicYears?
    let apiClient = ApiClient()
    
    func getAcademicYears() {
        apiClient.getAcademicYears() {(response, error) in
            if response != nil {
                self.academicYearsData = response
               
        }
    }
    
}
}
