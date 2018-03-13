//
//  PaymentsController.swift
//  eUniversity
//
//  Created by Damir Ramic on 13/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

protocol  PaymentsControllerDelegate: class {
    func onSuccess(response: Certificates)
    func onError(error:NSError)
}

class PaymentsController: NSObject {
    weak var delegate : PaymentsControllerDelegate?
    static let sharedController = PaymentsController()
    var certificateData  :  Certificates?
    let apiClient = ApiClient()
    
    func getPayment() {
        apiClient.getPayments() {(response, error) in
            if response != nil {
                self.certificateData = response
                self.delegate?.onSuccess(response: response!)
            }
        }
    }
    
}

