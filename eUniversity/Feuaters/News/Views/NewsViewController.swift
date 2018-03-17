//
//  NewsViewController.swift
//  eUniversity
//
//  Created by Damir Ramic on 17/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NewsController.sharedController.delegate = self
        NewsController.sharedController.getNews()
        self.tabBarItem.image = #imageLiteral(resourceName: "home")
        self.tabBarItem.title = "news".localized()
        

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.hidesBackButton = true
        self.tabBarController?.navigationItem.title  = "news".localized()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.title = "StudentStatus".localized()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let countNum =  NewsController.sharedController.announcments?.Announcements.count {
            return countNum
         }
        return  0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseIdentifier = "newsCell"
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? NewsTableViewCell
        if let countNum =  NewsController.sharedController.announcments?.Announcements.count {
            if countNum > 0 {
                
                cell?.populateCell(news: (NewsController.sharedController.announcments?.Announcements[indexPath.row])!)
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}

extension NewsViewController : NewsControllerDelegate {
     func onSuccess(response: Announcements) {
        print(response)
        self.tableView .reloadData()
    }
    
    func onError() {
    }
}
