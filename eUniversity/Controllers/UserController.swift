//
//  UserController.swift
//  eUniversity
//
//  Created by Damir Ramic on 16/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

protocol UserControllerDelegate: class {
    func onSuccess()
    func onError(error:eUniversityError)
}

class UserController: NSObject {
    
    weak var delegate : UserControllerDelegate?
    static let sharedController = UserController()
    
    var userName : String?
    var accessToken : String?
    var StudentID : Int?
    
    func login(userName:String,password:String) {
        let apiClient = ApiClient()
        apiClient.login(userName: userName, password: password) { (response, error) in
            if response != nil  {
            self.delegate?.onSuccess()
            } else if error != nil {
                self.delegate?.onError(error: error!)
            }
        }
    }

    
}


