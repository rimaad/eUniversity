//
//  ExamsController.swift
//  eUniversity
//
//  Created by Damir Ramic on 07/04/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

protocol  ExamsControllerDelegate: class {
    func onSuccess(response: ExamTerms)
    func onError(error:NSError)
}

class ExamsController: NSObject {
    static let sharedController = ExamsController()
    var examsData  :  ExamTerms?
    let apiClient = ApiClient()
    weak var delegate : ExamsControllerDelegate?
    
    func getExamTerms(ExamPeriodID:Int) {
        apiClient.getExamTerms(examTermId:ExamPeriodID) {(response, error) in
            if response != nil {
                self.examsData = response
                self.delegate?.onSuccess(response: response!)
            }
        }
    }
    
    func updateExam(ExamRegistrationID:Int,selected:Int) {
        apiClient.updateExam(ExamRegistrationID:ExamRegistrationID, selected: selected) { (response,error ) in
            if response != nil {
                print(response)
            }
        }
    }
    
    func registerExam(ExamTermId:Int) {
        apiClient.registerExam(ExamTermID:ExamTermId) { (response,error ) in
            print(response)
        }
    }
} 

