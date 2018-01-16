//
//  User.swift
//  eUniversity
//
//  Created by Damir Ramic on 15/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

struct Value : Decodable {
   let value : [User]
}

struct User : Decodable {
    let PersonID : Int
    let  FirstName : String
    let InstitutionName : String
    let AuthToken : String
    
  /*  init(json:[String:Any]) {
       
        
        PersonId = json["PersonID"] as? Int ?? -1
        FirstName = json["FirstName"] as? String ?? ""
        InstitutionName = json["InstitutionName"] as? String ?? ""
        AuthToken = json["AuthToken"] as? String ?? ""
    } */
}


