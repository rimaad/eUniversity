//
//  CertificateController.swift
//  eUniversity
//
//  Created by Damir Ramic on 08/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

protocol  CertificatesControllerDelegate: class {
    func onSuccess(response: Certificates)
    func onError(error:NSError)
}

class CertificateController: NSObject {
    weak var delegate : CertificatesControllerDelegate?
    static let sharedController = CertificateController()
    //static let certificatePurposeData
    var certificateData  :  Certificates?
    var certificatePurposeData : CertificatePurposes?
    var certificateTypesData : CertificateTypes?
    let apiClient = ApiClient()
    func getCertificates(academicYear:Bool,academicYearId:String){
        apiClient.getCertificates(byAcademicYear:academicYear,academicYearId:academicYearId){(response, error) in
            if response != nil {
                self.certificateData = response
                self.delegate?.onSuccess(response: response!)
            }
        }
    }
    
    func getCerticatePuproses() {
        apiClient.getCertificatesPurpose { (response, error) in
            if response != nil {
                self.certificatePurposeData = response
            }
        }
    }
    
    func getCerticateTypes() {
        apiClient.getCertificatesType { (response, error) in
            if response != nil {
                 self.certificateTypesData = response
            }
        }
    }
}
