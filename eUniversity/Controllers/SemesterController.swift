//
//  SemesterController.swift
//  eUniversity
//
//  Created by Damir Ramic on 2/8/18.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

protocol  SemesterControllerDelegate: class {
    func onSuccess(response: Semesters)
    func onError(error:NSError)
}

class SemesterController: NSObject {
    weak var delegate : SemesterControllerDelegate?
    let apiClient = ApiClient()
    var semesterData : Semesters?
    static let sharedController = SemesterController()
    func getSemesters(){
        apiClient.getSemesters(){(response, error) in
            if response != nil {
                self.semesterData = response
                self.delegate?.onSuccess(response: response!)
            }
        }
    }
}
