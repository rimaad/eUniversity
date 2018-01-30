//
//  GradesController.swift
//  eUniversity
//
//  Created by Damir Ramic on 28/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

protocol  GradesControllerDelegate: class {
    func onSuccess(response: StudentGrades)
    func onError()
}

class GradesController: NSObject {
    weak var delegate : GradesControllerDelegate?
    static let sharedController = GradesController()
    let apiClient = ApiClient()
    var gradesData : StudentGrades?
    
    
    func getGrades() {
    
        apiClient.getGrades() { (response, error) in
            if response != nil {
                self.gradesData = response
                self.delegate?.onSuccess(response: response!)
            }
        }
      
    }
}
