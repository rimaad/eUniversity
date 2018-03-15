//
//  PaymentsController.swift
//  eUniversity
//
//  Created by Damir Ramic on 13/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

protocol  PaymentsControllerDelegate: class {
    func onSuccess(response: Payments)
    func onError(error:NSError)
}

class PaymentsController: NSObject {
    weak var delegate : PaymentsControllerDelegate?
    static let sharedController = PaymentsController()
    var paymentsData  :  Payments?
    let apiClient = ApiClient()
    
    func getPayment(academicYear:Bool,academicYearId:String) {
        apiClient.getPayments(byAcademicYear:academicYear,yearId:academicYearId) {(response, error) in
            if response != nil {
                self.paymentsData = response
                self.delegate?.onSuccess(response: response!)
            }
        }
    }
    
}

