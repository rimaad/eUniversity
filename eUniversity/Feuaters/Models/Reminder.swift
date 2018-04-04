//
//  Reminder.swift
//  eUniversity
//
//  Created by Damir Ramic on 05/04/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

struct ReminderValue: Decodable {
    var value : Reminders
}

struct Reminders : Decodable {
    var Reminders : [Reminder]
}

struct  Reminder: Decodable {
    var  ReminderID : Int?
    var  Title : String?
    var  Text : String?
}
