//
//  Image.swift
//  eUniversity
//
//  Created by Damir Ramic on 27/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

struct ValueImage: Decodable {
    let value : Image
}

struct Image:Decodable  {
    let AnnouncementPhotos : String?
}
