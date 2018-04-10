//
//  SemesterViewController.swift
//  eUniversity
//
//  Created by Damir Ramic on 2/8/18.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class SemesterViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    let refreshController = RefreshContol()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.title = "semester".localized()
        self.tabBarItem.image = #imageLiteral(resourceName: "semesters")
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        SemesterController.sharedController.getSemesters()
        SemesterController.sharedController.delegate = self
        self.tableView.addSubview(refreshController.refreshControl)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshController.refreshControl.addTarget(self, action:
            #selector(SemesterViewController.handleRefresh(_:)),
                                                   for: UIControlEvents.valueChanged)
        self.tabBarController?.navigationItem.title = "semester".localized()
    }
    override func viewDidDisappear(_ animated: Bool) {
       
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        SemesterController.sharedController.getSemesters()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let countNum =  SemesterController.sharedController.semesterData?.Semesters.count {
            if countNum > 0 {
                return  countNum
            } else {
                return 0
            }
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cellReuseIdentifier = "semesterCell"
            let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? SemesterTableViewCell
            if let countNum =  SemesterController.sharedController.semesterData?.Semesters.count {
                if countNum > 0 {
                    
                    cell?.populateCell(semester: (SemesterController.sharedController.semesterData?.Semesters[indexPath.row])!)
                    return cell!
                }
            }
            return cell!
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //disable SemesterDetail
        // openSemesterDetail()
    }
    
    func openSemesterDetail() {
        
        let storyBoard = UIStoryboard(name:"Semestar", bundle:nil)
        let semesterVC = storyBoard.instantiateViewController(withIdentifier: "semestarDetail")
        self.present(semesterVC, animated: true, completion: nil)

    }
}

extension SemesterViewController : SemesterControllerDelegate {
    func onError(error: NSError) {
        
    }

    func onSuccess(response: Semesters) {
        print(response)
        self.tableView .reloadData()
        refreshController.refreshControl.endRefreshing()
    }

}
