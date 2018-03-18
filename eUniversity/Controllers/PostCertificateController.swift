//
//  PostCertificateController.swift
//  eUniversity
//
//  Created by Damir Ramic on 18/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

protocol  CreateCertificateControllerDelegate: class {
    func onSuccess(response: Certificate)
    func onError(error:NSError)
}

class PostCertificateController: NSObject {
    static let sharedController = PostCertificateController()
    var certificateData  :  Certificate?
    let apiClient = ApiClient()
    weak var delegate : CreateCertificateControllerDelegate?
    
    func postCertificate(purposeID:Int,typeID:Int,note:String) {
        apiClient.createCertificate(purposeID:purposeID,typeID: typeID,note:note) {(response, error) in
            if response != nil {
               self.certificateData = response
                self.delegate?.onSuccess(response: response!)
            }
        }
    }
}
