//
//  Certificate.swift
//  eUniversity
//
//  Created by Damir Ramic on 08/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

    struct CertificateValue: Decodable {
        var value : Certificates
    }
    
    struct Certificates: Decodable {
        
        var Certificates : [Certificate]
    }
    
    struct Certificate:Decodable {
        var AcademicYear :String?
        var Active:Int?
        var Answer:String?
        var CertificateID:Int?
        var CertificatePurpose:String?
        var CertificatePurposeID:Int?
        var CertificateType:String?
        var CertificateTypeID:Int?
        var CreatedDate:String?
        var Issued:Int?
        var IssuedDate:String?
        var Note:String?
        var StudentID:Int?        
    }
