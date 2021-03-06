//
//  GradesViewController.swift
//  eUniversity
//
//  Created by Damir Ramic on 28/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit



class GradesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource {
    let refreshController = RefreshContol()
    @IBOutlet weak var tableView: UITableView!
    var pickerView:UIPickerView?
    var nextBar = UIView()
    var pickerValues = ["allYears".localized(),"firstYear".localized(),"secondYear".localized(),"third".localized()]
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.title = "grades".localized()
        self.tabBarController?.navigationItem.title = "grades".localized()
        self.tabBarItem.image = #imageLiteral(resourceName: "grades")
    }
    var gradesSuccess = ["passed".localized(),"unpassed".localized()]
   
    override func viewDidLoad() {
        super.viewDidLoad()
       self.tabBarItem.title = "grades".localized()
        GradesController.sharedController.delegate = self
        StudentDataController.sharedController.getStudentData()
        GradesController.sharedController.getGrades()
        self.tableView.addSubview(refreshController.refreshControl)
        // Do any additional setup after loading the view.
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        GradesController.sharedController.getGrades()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpNavItems()
        refreshController.refreshControl.addTarget(self, action:
            #selector(NewsViewController.handleRefresh(_:)),
                                                   for: UIControlEvents.valueChanged)
        self.tabBarController?.navigationItem.hidesBackButton = true
        self.tabBarController?.navigationItem.title = "grades".localized()
    }
        
    override func viewDidDisappear(_ animated: Bool) {
        hideNavItems()
    }
    

    func setUpNavItems() {
        // Additional bar button items
        let button1 = UIBarButtonItem(image:#imageLiteral(resourceName: "search"), style: .plain, target: self, action: #selector(GradesViewController.filterPressed))
        let button2 = UIBarButtonItem(image:#imageLiteral(resourceName: "filter"), style: .plain, target: self, action: #selector(GradesViewController.filterSuccesPressed))
        self.tabBarController?.navigationItem.setRightBarButtonItems([button1, button2], animated: true)
    }
    
    func hideNavItems() {
        self.tabBarController?.navigationItem.setRightBarButtonItems(nil, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let countNum =  GradesController.sharedController.gradesData?.StudentGrades.count {
            switch (section) {
            case 1:
                return countNum
            case 0:
                if let num  = AverageGradesController.sharedController.averageGradesData?.AverageGrades.count {
                    return  num + 1
                } else {
                    return 0
                }
            default:
                return 0
            }
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 140
        }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerValues[row]
    }
    
 @objc func filterPressed() {
        createActionSheetView()
    }
    
 @objc func filterSuccesPressed() {
        createSuccessActionSheetView()
    }
    
    func createSuccessActionSheetView() {
        let myActionSheet =  UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        myActionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        myActionSheet.addAction(UIAlertAction(title: "passed".localized(), style: UIAlertActionStyle.default, handler: { (ACTION :UIAlertAction!)in
            GradesController.sharedController.getGradesBySuccess(isPassed: "true")
        }))
        myActionSheet.addAction(UIAlertAction(title: "unpassed".localized(), style: UIAlertActionStyle.default, handler: { (ACTION :UIAlertAction!)in
            GradesController.sharedController.getGradesBySuccess(isPassed: "false")
        }))
        
        self.present(myActionSheet, animated: true, completion: nil)
    }
    
    func createActionSheetView() {
        let myActionSheet =  UIAlertController(title: "Choose a year of study", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        myActionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        myActionSheet.addAction(UIAlertAction(title: "AllYears".localized(), style: UIAlertActionStyle.default, handler: { (ACTION :UIAlertAction!)in
            GradesController.sharedController.getGrades()
          
        }))
        myActionSheet.addAction(UIAlertAction(title: "FirstYear".localized(), style: UIAlertActionStyle.default, handler: { (ACTION :UIAlertAction!)in
            GradesController.sharedController.getGradesByYear(yearOfStudy: "1")
            
        }))
        myActionSheet.addAction(UIAlertAction(title: "SecondYear".localized(), style: UIAlertActionStyle.default, handler: { (ACTION :UIAlertAction!)in
            GradesController.sharedController.getGradesByYear(yearOfStudy: "2")
        }))
        
        myActionSheet.addAction(UIAlertAction(title: "ThirdYear".localized(), style: UIAlertActionStyle.default, handler: { (ACTION :UIAlertAction!)in
            GradesController.sharedController.getGradesByYear(yearOfStudy: "3")
        }))
        
        self.present(myActionSheet, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cellReuseIdentifier = "studentData"
            let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? StudentDataTableViewCell
            if (StudentDataController.sharedController.studentData != nil) {
                cell?.populateCell(row:indexPath.row)
                
            }
            return cell!
        } else {
        let cellReuseIdentifier = "gradesCell"
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? GradesTableViewCell
        if let countNum =  GradesController.sharedController.gradesData?.StudentGrades.count {
            if countNum > 0 {
                
                cell?.populateCell(grade: (GradesController.sharedController.gradesData?.StudentGrades[indexPath.row])!)
                return cell!
                }
            }
            return cell!
        }
      }
    }

    
extension GradesViewController : GradesControllerDelegate {
   
    func onSuccess(response: StudentGrades) {
        print(response)
        self.tableView .reloadData()
        refreshController.refreshControl.endRefreshing()
    }
    
    func onError() {
    }
}
