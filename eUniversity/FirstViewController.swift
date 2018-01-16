//
//  FirstViewController.swift
//  eUniversity
//
//  Created by Damir Ramic on 06/12/2017.
//  Copyright © 2017 Damir Ramich. All rights reserved.
//

import UIKit
import Localize_Swift

class FirstViewController: UIViewController {
    @IBOutlet weak var emptyLabel: UILabel! {
        didSet {
             // emptyLabel.text =  NSLocalizedString("empty_lbl", comment: "")
        }
        
    }
    let shownLanguage = Bool()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (UserDefaults.standard.object(forKey: "languageViewShown") != nil) {
            emptyLabel.text =  NSLocalizedString("empty_lbl", comment: "")
            print(Localize.currentLanguage())
            print (Localize.availableLanguages())
        } else {
            openChooseLanguage()
            
        }
    }
    
    func openChooseLanguage() {
        UserDefaults.standard.setValue(true, forKey: "languageViewShown")
        let storyboard = UIStoryboard(name: "Language", bundle: nil)
        let chooseLanguage = storyboard.instantiateViewController(withIdentifier: "languageController") as! ChooseLanguageViewController
        chooseLanguage.modalPresentationStyle = .fullScreen
        self.present(chooseLanguage, animated: true, completion: nil)
    }


}

