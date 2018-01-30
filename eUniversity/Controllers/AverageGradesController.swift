//
//  AverageGradesController.swift
//  eUniversity
//
//  Created by Damir Ramic on 30/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

protocol  AverageGradesControllerDelegate: class {
    func onSuccess(response: AverageGrades)
    func onError(error:NSError)
}

class AverageGradesController: NSObject {
    weak var delegate : AverageGradesControllerDelegate?
    static let sharedController = AverageGradesController()
    let apiClient = ApiClient()
    var averageGradesData : AverageGrades?
    
    func getAvarageGrades() {
        apiClient.getAverageGrades(){(response, error) in
        if response != nil {
            self.averageGradesData = response
            self.delegate?.onSuccess(response: response!)
            }
        }
    }
}
