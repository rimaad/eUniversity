//
//  CreateCertificateViewController.swift
//  eUniversity
//
//  Created by Damir Ramic on 18/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit
import SVProgressHUD

class CreateCertificateViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    @IBOutlet weak var certificateTypeTextField: UITextField!
    @IBOutlet weak var certificatePurpose: UITextField!
    let certTypePicker = UIPickerView()
    let certPurposePicker = UIPickerView()
    var purposeID : Int?
    var typeID:Int?
    
    @IBOutlet weak var sendButton: UIButton! {
        didSet {
            sendButton.setTitle("send".localized(), for: .normal)
        }
    }
    @IBOutlet weak var cancelButton: UIButton! {
        didSet {
            cancelButton.setTitle("cancel".localized(), for: .normal)
        }
    }
    @IBOutlet weak var noteText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        certificateTypeTextField.inputView = certTypePicker
        certificatePurpose.inputView = certPurposePicker
        CertificateController.sharedController.getCerticatePuproses()
        CertificateController.sharedController.getCerticateTypes()
        certPurposePicker.delegate = self
        certTypePicker.delegate = self
        PostCertificateController.sharedController.delegate = self
        CertificateController.sharedController.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func cancelButtonPressd(_ sender: Any) {
        self.dismiss(animated: false, completion:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UIPickerView Delegation
    
   func numberOfComponents(in pickerView: UIPickerView) -> Int {
   
            return 1
    
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == certTypePicker {
            return CertificateController.sharedController.certificateTypesData?.CertificateTypes.count ?? 0
        } else {
            return CertificateController.sharedController.certificatePurposeData?.CertificatePurposes.count ?? 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == certTypePicker {
            return CertificateController.sharedController.certificateTypesData?.CertificateTypes[row].Name
        } else {
            return CertificateController.sharedController.certificatePurposeData?.CertificatePurposes[row].Name
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == certTypePicker {
            certificateTypeTextField.text = CertificateController.sharedController.certificateTypesData?.CertificateTypes[row].Name
            typeID = CertificateController.sharedController.certificateTypesData?.CertificateTypes[row].CertificateTypeID
        } else {
            certificatePurpose.text =  CertificateController.sharedController.certificatePurposeData?.CertificatePurposes[row].Name
            purposeID = CertificateController.sharedController.certificatePurposeData?.CertificatePurposes[row].CertificatePurposeID
        }
        
        self.view.endEditing(true)
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        SVProgressHUD.show()
        PostCertificateController.sharedController.postCertificate(purposeID: purposeID ?? 0, typeID:typeID ?? 0,note:noteText.text)
    }
}

extension CreateCertificateViewController:CreateCertificateControllerDelegate {
    func onSuccess(response: Certificate) {

        SVProgressHUD.dismiss()
        self.dismiss(animated: true, completion: nil)
    }
    
    func onError(error: NSError) {
         SVProgressHUD.dismiss()
    }
}

extension CreateCertificateViewController: CertificatesControllerDelegate {
func onSuccess(response: Certificates) {

    }
}
