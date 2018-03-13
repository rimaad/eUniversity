//
//  ExamsPeriodController.swift
//  eUniversity
//
//  Created by Damir Ramic on 13/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

protocol  ExamsPeriodControllerDelegate: class {
    func onSuccess(response: Certificates)
    func onError(error:NSError)
}

class ExamsPeriodController: NSObject {
    weak var delegate : ExamsPeriodControllerDelegate?
    static let sharedController = ExamsPeriodController()
    var certificateData  :  Certificates?
    let apiClient = ApiClient()
    
    func getExamPeriods() {
        apiClient.getExamPeriods() {(response, error) in
            if response != nil {
                self.certificateData = response
                self.delegate?.onSuccess(response: response!)
            }
        }
    }
    
}
