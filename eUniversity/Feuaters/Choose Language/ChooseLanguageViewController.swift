//
//  ChooseLanguageViewController.swift
//  eUniversity
//
//  Created by Damir Ramic on 17/12/2017.
//  Copyright © 2017 Damir Ramich. All rights reserved.
//

import UIKit
import Localize_Swift



class ChooseLanguageViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
   
    
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var subTitileLabel: UILabel! {
        didSet {
            subTitileLabel.text = NSLocalizedString("subtitle_lbl", comment: "")
        }
    }
    @IBOutlet weak var welcomeLabelTitle: UILabel! {
        didSet {
            welcomeLabelTitle.text = "welcome_lbl".localized()
            
        }
    }
    @IBOutlet weak var languageTextField: UITextField!
    let pickerView = UIPickerView()
    var languages = ["Bosnian","Croatian","Serbian","English"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        languageTextField.delegate = self
        addKeyboardToolBar()
        languageTextField.inputView = pickerView
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languages[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        languageTextField.text = languages[row]
        setLanguage(rowValue: row)
        
    }
    
    func addKeyboardToolBar() {
        var nextBtn: UIBarButtonItem?
        let keyboardToolBar = UIToolbar(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(pickerView.frame.size.width), height: CGFloat(25)))
        keyboardToolBar.sizeToFit()
        keyboardToolBar.barStyle = .default
        languageTextField.inputAccessoryView = keyboardToolBar
         nextBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.textFieldShouldReturn(_:)))
        keyboardToolBar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), nextBtn!]
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        languageTextField.resignFirstResponder()
       // welcomeLabelTitle.text = "welcome_lbl".localized(lang: "bs-BA")
        return true
    }
 
    @IBAction func nextButtonPressed(_ sender: Any) {
       self.dismiss(animated: true, completion: nil)
        
    }
    
    func setLanguage(rowValue:Int) {
        let language = Language()
        switch rowValue {
        case 0:
            language.setLanguage(languageType: .Bosnian)
        case 1:
            language.setLanguage(languageType: .Croatian)
        case 2:
            language.setLanguage(languageType: .Serbian)
        case 3:
            language.setLanguage(languageType: .English)
        default:
             language.setLanguage(languageType: .English)
        }
    }
}
