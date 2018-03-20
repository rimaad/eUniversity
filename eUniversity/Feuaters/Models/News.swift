//
//  News.swift
//  eUniversity
//
//  Created by Damir Ramic on 1/19/18.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

struct ValueNews: Decodable {    
    let value : Announcements
}

struct Announcements : Decodable {
    let Announcements : [News]
}

struct News : Decodable {
    
    let AnnouncementID : Int
    let AnnouncementIconID : Int
    let Author :String?
    let Course : String?
    let CourseShortName : String?
    let Date : String?
    let SyllabusID : Int?
    let Text : String?
    let Title : String?
    let HasDocuments : Bool?

}
