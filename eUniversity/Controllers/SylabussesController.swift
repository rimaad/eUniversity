//
//  SylabussesController.swift
//  eUniversity
//
//  Created by Damir Ramic on 3/19/18.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class SylabussesController: NSObject {
    static let sharedController = SylabussesController()
    var syllabussesData  :  Syllabuses?
    let apiClient = ApiClient()
    
    func getSyllabusses() {
        apiClient.getSyllabusses() {(response, error) in
            if response != nil {
                self.syllabussesData = response
            }
        }
    }
}
