//
//  AttendanceViewController.swift
//  eUniversity
//
//  Created by Damir Ramic on 19/02/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class AttendanceViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {


    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AttendancesController.sharedController.getAttendances()
        AttendancesController.sharedController.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let countNum =  AttendancesController.sharedController.attendanceData?.Attendance.count {
            if countNum > 0 {
                return countNum
            } else {
                return 0
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseIdentifier = "attendanceCell"
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? AttendanceTableViewCell
        if let countNum =  AttendancesController.sharedController.attendanceData?.Attendance.count {
            if countNum > 0 {
                
               cell?.populateCell(attendance: (AttendancesController.sharedController.attendanceData?.Attendance[indexPath.row])!)
                return cell!
            }
        }
        return cell!
        
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.title = "attendances".localized()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openDetailsScreen(syllabusId:"\(AttendancesController.sharedController.attendanceData?.Attendance[indexPath.row].SyllabusID ?? 0)")
    }
    
    func openDetailsScreen(syllabusId:String) {
        let storyboard = UIStoryboard(name: "AttendanceDetail", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "attendanceDetail") as! AttendancesDetailViewController
        vc.syllabusId = syllabusId
        navigationController?.pushViewController(vc,animated: true)
    }
    
}

extension AttendanceViewController : AttendancesControllerDelegate {
    
    func onError(error: NSError) {
        
    }
    
    func onSuccess(response: Attendances) {
        print(response)
        self.tableView .reloadData()
    }
    
}
