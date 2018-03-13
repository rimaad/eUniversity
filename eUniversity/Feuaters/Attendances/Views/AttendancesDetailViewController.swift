//
//  AttendancesDetailViewController.swift
//  eUniversity
//
//  Created by Damir Ramic on 12/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class AttendancesDetailViewController: UIViewController {
    
    var syllabusId :String?

    override func viewDidLoad() {
        super.viewDidLoad()
       AttendanceDetailController.sharedController.delegate = self
        AttendanceDetailController.sharedController.getAttendanceDetail(syllabusId: syllabusId ?? "")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension AttendancesDetailViewController: AttendancesDetailControllerDelegate
{
    func onSuccess(response: AttendancesDetails) {
        
    }
    
    func onError(error: NSError) {
        
    }
}
