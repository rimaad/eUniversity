//
//  SemesterDetailController.swift
//  eUniversity
//
//  Created by Damir Ramic on 06/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

protocol  SemesterDetailControllerDelegate: class {
    func onSuccess(response: Attendances)
    func onError(error:NSError)
}

class SemesterDetailController: NSObject {
    weak var delegate : SemesterDetailControllerDelegate?
    static let sharedController = SemesterDetailViewController()
    var attendanceData  :  Attendances?
    let apiClient = ApiClient()
    func getAttendances(){
        apiClient.getAttendances(){(response, error) in
            if response != nil {
                self.attendanceData = response
                self.delegate?.onSuccess(response: response!)
            }
        }
    }
}

