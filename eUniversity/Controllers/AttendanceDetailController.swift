//
//  AttendanceDetailController.swift
//  eUniversity
//
//  Created by Damir Ramic on 12/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

protocol  AttendancesDetailControllerDelegate: class {
    func onSuccess(response: AttendancesDetails)
    func onError(error:NSError)
}

class AttendanceDetailController: NSObject {
    weak var delegate : AttendancesDetailControllerDelegate?
    static let sharedController = AttendanceDetailController()
    var certificateData  :  AttendancesDetails?
    let apiClient = ApiClient()
    
    func getAttendanceDetail(syllabusId:String) {
        apiClient.getAttendanceDetail(syllabusID:syllabusId){(response, error) in
            if response != nil {
                self.certificateData = response
                self.delegate?.onSuccess(response: response!)
            }
        }
    }
}

