//
//  ExamsViewController.swift
//  eUniversity
//
//  Created by Damir Ramic on 07/04/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit
import NotificationBannerSwift

class ExamsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let refreshController = RefreshContol()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Ispitni termini"
        ExamsController.sharedController.getExamTerms(ExamPeriodID: ExamsPeriodController.sharedController.examsData?.ExamPeriods[0].ExamPeriodID ?? 0)
        ExamsController.sharedController.delegate = self
        setUpNavItems()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshController.refreshControl.addTarget(self, action:
            #selector(ExamsViewController.handleRefresh(_:)),
                                                   for: UIControlEvents.valueChanged)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.registeredExam(notfication:)), name: .registeredExam , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updatedExam(notfication:)), name: .updatedExam , object: nil)
    }
    
    func setUpNavItems() {
        // Additional bar button items
        let button1 = UIBarButtonItem(image:#imageLiteral(resourceName: "search"), style: .plain, target: self, action: #selector(ExamsViewController.filterPressed))
        button1.tintColor = UIColor.white
        
         navigationItem.setRightBarButtonItems([button1], animated: true)
    }
    
    @objc func registeredExam(notfication: NSNotification) {
        let banner = NotificationBanner(title: "", subtitle:"Uspješno ste prijavili ispit", style: .info)
        banner.duration = 0.4
        banner.show()
 ExamsController.sharedController.getExamTerms(ExamPeriodID:ExamsPeriodController.sharedController.examsData?.ExamPeriods[0].ExamPeriodID ?? 0)
    }
    
    @objc func updatedExam(notfication: NSNotification) {
        let banner = NotificationBanner(title: "", subtitle:"Uspješno ste odjavili ispit", style: .info)
        banner.duration = 0.4
        banner.show()
        ExamsController.sharedController.getExamTerms(ExamPeriodID:ExamsPeriodController.sharedController.examsData?.ExamPeriods[0].ExamPeriodID ?? 0)
    }
    
    @objc func filterPressed() {
            createActionSheetView()
    }
    
    @IBAction func segmentedControllChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            ExamsController.sharedController.registerExam(ExamTermId: ExamsController.sharedController.examsData?.ExamTerms[sender.tag].ExamTermID ?? 0)
        } else {
            ExamsController.sharedController.updateExam(ExamRegistrationID:ExamsController.sharedController.examsData?.ExamTerms[sender.tag].ExamRegistrationID ?? 0, selected:sender.selectedSegmentIndex)
        }
    }
    
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        ExamsController.sharedController.getExamTerms(ExamPeriodID: ExamsPeriodController.sharedController.examsData?.ExamPeriods[0].ExamPeriodID ?? 0)
    }
    
    func createActionSheetView() {
        let myActionSheet =  UIAlertController(title: "Odaberite ispitni rok", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        myActionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        for examPeriod in (ExamsPeriodController.sharedController.examsData?.ExamPeriods)! {
            
            myActionSheet.addAction(UIAlertAction(title:examPeriod.Name, style: UIAlertActionStyle.default, handler: { (ACTION :UIAlertAction!)in
                ExamsController.sharedController.getExamTerms(ExamPeriodID:examPeriod.ExamPeriodID ?? 0)
            }))
        }
        self.present(myActionSheet, animated: true, completion: nil)
    }
    
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellReuseIdentifier = "examsCell"
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? ExamsTableViewCell
        if let countNum =  ExamsPeriodController.sharedController.examsData?.ExamPeriods.count {
            if countNum > 0 {
                cell?.populateCell(indexPath: indexPath.row)
                cell?.segmentedControlExam.tag = indexPath.row
                return cell!
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let countNum = ExamsController.sharedController.examsData?.ExamTerms.count{
            if countNum > 0 {
                return countNum
            }
        }
        return 0
    }
}

extension ExamsViewController : ExamsControllerDelegate {
    func onSuccess(response: ExamTerms) {
        self.tableView.reloadData()
        refreshController.refreshControl.endRefreshing()
        
    }
    
    
    func onError(error: NSError) {
        
    }
}

extension Notification.Name {
    static let registeredExam = Notification.Name("registeredExam")
}

extension Notification.Name {
    static let updatedExam = Notification.Name("updatedExam")
}
