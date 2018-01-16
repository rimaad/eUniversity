//
//  Language.swift
//  eUniversity
//
//  Created by Damir Ramic on 23/12/2017.
//  Copyright © 2017 Damir Ramich. All rights reserved.
//

import UIKit
import Localize_Swift

enum LanguageType {
    case Bosnian
    case Croatian
    case Serbian
    case English
}

class Language: NSObject {
    
    func setLanguage(languageType:LanguageType) {
        
        switch  languageType {
        case .Bosnian:
            Localize.setCurrentLanguage("bs-BA")
        case .Croatian:
             Localize.setCurrentLanguage("hr-HR")
        case .Serbian:
            Localize.setCurrentLanguage("sr")
        case .English:
            Localize.setCurrentLanguage("en-US")
        default:
            break
        }
    }
    
}
