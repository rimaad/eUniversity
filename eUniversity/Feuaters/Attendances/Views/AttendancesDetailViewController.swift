//
//  AttendancesDetailViewController.swift
//  eUniversity
//
//  Created by Damir Ramic on 12/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class AttendancesDetailViewController: UIViewController {
    
    @IBOutlet weak var labProgress: UIProgressView!
    @IBOutlet weak var labPrecentage: UILabel!
    @IBOutlet weak var labLabel: UILabel! {
        didSet {
            labLabel.text = "lab".localized()
        }
    }
    @IBOutlet weak var exerciseProgress: UIProgressView!
    @IBOutlet weak var exercisePrecentage: UILabel!
    @IBOutlet weak var exerciseLabel: UILabel! {
        didSet {
            exerciseLabel.text = "exercise".localized()
        }
    }
    @IBOutlet weak var lectureProgress: UIProgressView!
    @IBOutlet weak var lecturesPrecentage: UILabel!
    @IBOutlet weak var lecturesLabel: UILabel! {
        didSet {
            lecturesLabel.text = "lectures".localized()
        }
    }
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
    
    func setUpDetails() {
        let precentageValue = Float(AttendanceDetailController.sharedController.attendanceDetailsData?.Attendance[0].Percentage ?? 0) / 100
        lectureProgress.setProgress(precentageValue, animated: false)
        lecturesLabel.text = AttendanceDetailController.sharedController.attendanceDetailsData?.Attendance[0].TeachingType
        lecturesPrecentage.text = "\(AttendanceDetailController.sharedController.attendanceDetailsData?.Attendance[0].Percentage ?? 0)" + "%"
        
        let precentageValueExercise = Float(AttendanceDetailController.sharedController.attendanceDetailsData?.Attendance[1].Percentage ?? 0) / 100
        exerciseProgress.setProgress(precentageValueExercise, animated: false)
        exerciseLabel.text = AttendanceDetailController.sharedController.attendanceDetailsData?.Attendance[1].TeachingType
        exercisePrecentage.text = "\(AttendanceDetailController.sharedController.attendanceDetailsData?.Attendance[1].Percentage ?? 0)" + "%"
        
        let precentageValueLab = Float(AttendanceDetailController.sharedController.attendanceDetailsData?.Attendance[2].Percentage ?? 0) / 100
        labProgress.setProgress(precentageValueLab, animated: false)
        labLabel.text = AttendanceDetailController.sharedController.attendanceDetailsData?.Attendance[2].TeachingType
        labPrecentage.text = "\(AttendanceDetailController.sharedController.attendanceDetailsData?.Attendance[2].Percentage ?? 0)" + "%"
        
    }
}

extension AttendancesDetailViewController: AttendancesDetailControllerDelegate
{
    func onSuccess(response: AttendancesDetails) {
        setUpDetails()
    }
    
    func onError(error: NSError) {
        
    }
}
