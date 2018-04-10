//
//  CertificatesViewController.swift
//  eUniversity
//
//  Created by Damir Ramic on 11/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class CertificatesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    let refreshController = RefreshContol()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavItems()
        navigationItem.title = "certificate".localized()
        CertificateController.sharedController.delegate = self
        self.tableView.addSubview(refreshController.refreshControl)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        CertificateController.sharedController.getCertificates(academicYear: false, academicYearId: "0")
        refreshController.refreshControl.addTarget(self, action:
            #selector(CertificatesViewController.handleRefresh(_:)),for: UIControlEvents.valueChanged)
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        CertificateController.sharedController.getCertificates(academicYear: false, academicYearId:"")
    }
    
    
    func setUpNavItems() {
        // Additional bar button items
        let button1 = UIBarButtonItem(image:#imageLiteral(resourceName: "search"), style: .plain, target: self, action: #selector(CertificatesViewController.filterByAcademicYear))
        let button2 = UIBarButtonItem(image:#imageLiteral(resourceName: "icon_plus"), style: .plain, target: self, action: #selector(CertificatesViewController.createCertificate))
        navigationItem.setRightBarButtonItems([button1, button2], animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   @objc func filterByAcademicYear() {
        createActionSheetView()
    }
    
    @objc func createCertificate() {
        openCreateCertificate()
    }
    
    func openCreateCertificate() {
        let storyboard : UIStoryboard = UIStoryboard(name: "Certificate", bundle: nil)
       let vc = storyboard.instantiateViewController(withIdentifier: "createCertificate")
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true, completion: nil)
    }
    
    func createActionSheetView() {
        let myActionSheet =  UIAlertController(title: "Choose academic year".localized(), message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        myActionSheet.addAction(UIAlertAction(title: "Cancel".localized(), style: UIAlertActionStyle.cancel, handler: nil))
        
        for academicYear in (AcademicYearsController.sharedController.academicYearsData?.AcademicYears)! {
            
            myActionSheet.addAction(UIAlertAction(title:academicYear.AcademicYear, style: UIAlertActionStyle.default, handler: { (ACTION :UIAlertAction!)in
                CertificateController.sharedController.getCertificates(academicYear: true, academicYearId: "\(academicYear.AcademicYearID ?? 0)")
            }))
        }
        self.present(myActionSheet, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // create the alert
        let alert = UIAlertController(title: "note".localized(), message:CertificateController.sharedController.certificateData?.Certificates[indexPath.row].Note, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseIdentifier = "certificateCell"
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? CertificateTableViewCell
        if let countNum =  CertificateController.sharedController.certificateData?.Certificates.count {
            if countNum > 0 {
                cell?.populateCell(indexPath: indexPath.row)
                return cell!
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (CertificateController.sharedController.certificateData?.Certificates.count ?? 0)
    }
}

extension CertificatesViewController:CertificatesControllerDelegate {
    func onSuccess(response: Certificates) {
        self.tableView.reloadData()
        refreshController.refreshControl.endRefreshing()
    }
    
    func onError(error: NSError) {
        
    }
    
    
    
}
