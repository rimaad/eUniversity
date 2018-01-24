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
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        StudentDataController.sharedController.delegate = self
        StudentDataController.sharedController.getStudentData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseIdentifier = "statusData"
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? StatusDataTableViewCell
        if (StudentDataController.sharedController.studentData != nil) {
            cell?.populateCell(cellIndex: indexPath.row)
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return  9
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}

extension StatusDataViewController : StudentDataControllerDelegate {
        func onSuccess() {
            self.tableView .reloadData()
        }
        func onError() {
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


