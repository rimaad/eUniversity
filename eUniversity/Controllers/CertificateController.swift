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
    var certificateData  :  Certificates?
    let apiClient = ApiClient()
    func getCertificates(){
        apiClient.getCertificates(){(response, error) in
            if response != nil {
                self.certificateData = response
                self.delegate?.onSuccess(response: response!)
            }
        }
    }
}
