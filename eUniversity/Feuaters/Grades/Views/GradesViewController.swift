//
//  GradesViewController.swift
//  eUniversity
//
//  Created by Damir Ramic on 28/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class GradesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional bar button items
        let button1 = UIBarButtonItem(image:#imageLiteral(resourceName: "filter"), style: .plain, target: self, action: #selector(GradesViewController.filterPressed))
        let button2 = UIBarButtonItem(image:#imageLiteral(resourceName: "filter"), style: .plain, target: self, action: Selector(("methodB")))
        self.tabBarController?.navigationItem.setRightBarButtonItems([button1, button2], animated: true)
        GradesController.sharedController.delegate = self
        GradesController.sharedController.getGrades()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let countNum =  GradesController.sharedController.gradesData?.StudentGrades.count {
            if countNum > 0 {
                
                // cell?.populateCell(news: (NewsController.sharedController.announcments?.Announcements[indexPath.row])!)
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
    
 @objc func filterPressed() {
    let alertController = UIAlertController(title: "Action Sheet", message: "What would you like to do?", preferredStyle: .actionSheet)
    
    let sendButton = UIAlertAction(title: "Send now", style: .default, handler: { (action) -> Void in
        print("Ok button tapped")
    })
    
    let  deleteButton = UIAlertAction(title: "Delete forever", style: .destructive, handler: { (action) -> Void in
        print("Delete button tapped")
    })
    
    let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
        print("Cancel button tapped")
    })
    
    
    alertController.addAction(sendButton)
    alertController.addAction(deleteButton)
    alertController.addAction(cancelButton)
    
    self.present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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

    
extension GradesViewController : GradesControllerDelegate {
   
    func onSuccess(response: StudentGrades) {
        print(response)
        self.tableView .reloadData()
    }
    
    func onError() {
    }
}
