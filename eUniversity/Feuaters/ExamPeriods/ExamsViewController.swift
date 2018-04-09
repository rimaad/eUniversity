//
//  ExamsViewController.swift
//  eUniversity
//
//  Created by Damir Ramic on 07/04/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class ExamsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellReuseIdentifier = "examsCell"
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
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
