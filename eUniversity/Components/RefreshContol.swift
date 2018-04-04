//
//  RefreshContol.swift
//  eUniversity
//
//  Created by Damir Ramic on 31/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class RefreshContol: NSObject {
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.lightGray
        return refreshControl
    }()
}
