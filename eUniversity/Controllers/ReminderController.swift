//
//  ReminderController.swift
//  eUniversity
//
//  Created by Damir Ramic on 05/04/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit
protocol  ReminderControllerDelegate: class {
    func onSuccess(response: Reminders)
    func onError(error:NSError)
}

class ReminderController: NSObject {
    static let sharedController = ReminderController()
    var reminderData  :  Reminders?
    let apiClient = ApiClient()
    
    func getReminders() {
        apiClient.getReminders() {(response, error) in
            if response != nil {
                self.reminderData = response
                NotificationCenter.default.post(name: .reminder, object: nil)
            }
        }
    }
}
