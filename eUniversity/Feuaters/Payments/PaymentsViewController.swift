//
//  PaymentsViewController.swift
//  eUniversity
//
//  Created by Damir Ramic on 14/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class PaymentsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var paymentsData : Payments?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavItems()
        PaymentsController.sharedController.getPayment(academicYear: false, academicYearId:"")
        PaymentsController.sharedController.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpNavItems() {
        // Additional bar button items
        let button1 = UIBarButtonItem(image:#imageLiteral(resourceName: "search"), style: .plain, target: self, action: #selector(PaymentsViewController.filterPressed))
        navigationItem.title = "Payments"
        navigationItem.setRightBarButtonItems([button1], animated: true)
    }
    
    @objc func filterPressed() {
        createActionSheetView()
    }
    
    func createActionSheetView() {
        let myActionSheet =  UIAlertController(title: "Choose academic year", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        myActionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        for academicYear in (AcademicYearsController.sharedController.academicYearsData?.AcademicYears)! {
            
            myActionSheet.addAction(UIAlertAction(title:academicYear.AcademicYear, style: UIAlertActionStyle.default, handler: { (ACTION :UIAlertAction!)in
                PaymentsController.sharedController.getPayment(academicYear: true, academicYearId: "\(academicYear.AcademicYearID ?? 0)")
            }))
        }
        self.present(myActionSheet, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseIdentifier = "paymentCell"
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? PaymentsTableViewCell
        if let countNum =  paymentsData?.Payments.count {
            if countNum > 0 {
                
                cell?.populateCell(payment: (PaymentsController.sharedController.paymentsData?.Payments[indexPath.row])!)
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return PaymentsController.sharedController.paymentsData?.Payments.count ?? 0
    }

}

extension PaymentsViewController : PaymentsControllerDelegate {
    func onSuccess(response: Payments) {
        self.tableView.reloadData()
        paymentsData = response
    }
    
    func onError(error: NSError) {
        
    }
}
