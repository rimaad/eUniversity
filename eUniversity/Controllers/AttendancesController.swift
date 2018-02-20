//
//  AttendancesController.swift
//  eUniversity
//
//  Created by Damir Ramic on 19/02/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

protocol  AttendancesControllerDelegate: class {
    func onSuccess(response: Attendances)
    func onError(error:NSError)
}

class AttendancesController: NSObject {
    weak var delegate : AttendancesControllerDelegate?
    static let sharedController = AttendancesController()
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
