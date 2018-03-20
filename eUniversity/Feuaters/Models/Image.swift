//
//  Image.swift
//  eUniversity
//
//  Created by Damir Ramic on 27/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

struct ValueImage: Decodable {
    let value : AnnouncementPhotos
}

struct AnnouncementPhotos:Decodable  {
    let AnnouncementPhotos : [Images]
}

struct Images : Decodable {
    var AnnouncementID : Int?
    var AnnouncementPhotoID: Int?
    var Name:String?
    var PhotoBase64:String?
}
