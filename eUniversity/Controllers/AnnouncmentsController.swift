//
//  AnnouncmentsController.swift
//  eUniversity
//
//  Created by Damir Ramic on 08/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

protocol  AnnouncmentsControllerDelegate: class {
    func onSuccess(response: Attendances)
    func onError(error:NSError)
}


class AnnouncmentsController: NSObject {
    weak var delegate : AnnouncmentsControllerDelegate?
    static let sharedController = AnnouncmentViewController()
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
