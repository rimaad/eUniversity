//
//  StudentData.swift
//  eUniversity
//
//  Created by Damir Ramic on 21/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

protocol  StudentDataControllerDelegate: class {
    func onSuccess()
    func onError()
}

class StudentDataController: NSObject {
    
    weak var delegate : StudentDataControllerDelegate?
    static let sharedController = StudentDataController()
    var studentData : StudentData?
    let apiClient = ApiClient()
    
    func getStudentData() {
        apiClient.getStudentStatus() { (response, error) in
            
        if response != nil {
            self.studentData = response
             self.delegate?.onSuccess()
        }
    }
}
}
