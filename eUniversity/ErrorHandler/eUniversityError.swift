//
//  eUniversityError.swift
//  eUniversity
//
//  Created by Damir Ramic on 2/7/18.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit
import NotificationBannerSwift

class eUniversityError: Decodable {
    var exceptionCode :Int?
    var exceptionMessage:String?
    var value:String?

    func showErrorMessage(message:String) {
        let banner = NotificationBanner(title: "Greska", subtitle:message, style: .danger)
        banner.show()
    }
}
