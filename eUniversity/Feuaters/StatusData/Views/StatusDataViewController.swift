//
//  StatusDataViewController.swift
//  eUniversity
//
//  Created by Damir Ramic on 20/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class StatusDataViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    let refreshController = RefreshContol()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        StudentDataController.sharedController.delegate = self
        StudentDataController.sharedController.getStudentData()
        AverageGradesController.sharedController.getAvarageGrades()
        self.tableView.addSubview(refreshController.refreshControl)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "statusData".localized()
        refreshController.refreshControl.addTarget(self, action:
            #selector(StatusDataViewController.handleRefresh(_:)),
                                                   for: UIControlEvents.valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 90
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        NewsController.sharedController.getNews()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        let cellReuseIdentifier = "statusData"
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? StatusDataTableViewCell
        if (StudentDataController.sharedController.studentData != nil) {
            cell?.populateCell(cellIndex: indexPath.row)
        }
        return cell!
        } else  {
            let cellReuseIdentifier = "studentData"
            let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? StudentDataTableViewCell
            if (StudentDataController.sharedController.studentData != nil) {
                cell?.populateCell(row:indexPath.row)
                
            }
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch (section) {
        case 0:
            return 9
        case 1:
            if let num  = StudentDataController.sharedController.studentData?.StudyYear {
                return  num 
            } else {
                return 0
            }
        default:
            return 0
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.title = "statusData".localized()
        self.tabBarItem.image = #imageLiteral(resourceName: "profile-icon")
    }
    

}

extension StatusDataViewController : StudentDataControllerDelegate {
        func onSuccess() {
            self.tableView .reloadData()
        }
        func onError() {
        }
    }

extension StatusDataViewController : AverageGradesControllerDelegate {
    func onSuccess(response: AverageGrades) {
        self.tableView.reloadData()
        refreshController.refreshControl.endRefreshing()
    }

    func onError(error:NSError) {
        let errorHandler = eUniversityError()
        errorHandler.showErrorMessage(message: "something_went_wrong    ")
    }
    
}

