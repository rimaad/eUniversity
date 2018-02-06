//
//  DoubleExtension.swift
//  eUniversity
//
//  Created by Damir Ramic on 2/6/18.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

extension  Double {
  
        /// Rounds the double to decimal places value
        func rounded(toPlaces places:Int) -> Double {
            let divisor = pow(10.0, Double(places))
            return (self * divisor).rounded() / divisor
        }
    }

