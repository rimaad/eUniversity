//
//  MenuViewController.swift
//  eUniversity
//
//  Created by Damir Ramic on 06/03/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuImageView: UIImageView!
    
    @IBOutlet weak var nameLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpNavItems()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        hideNavItems()
    }
    
    func setUpNavItems() {
        // Additional bar button items
        let buttonBack = UIBarButtonItem(image:#imageLiteral(resourceName: "backButton"), style: .plain, target: self, action: #selector(MenuViewController.backAction))

        self.tabBarController?.navigationItem.setLeftBarButtonItems([buttonBack], animated: true)
    }
    
    func hideNavItems() {
        self.tabBarController?.navigationItem.setLeftBarButtonItems(nil, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.title = "menu".localized()
        self.tabBarItem.image = #imageLiteral(resourceName: "menuMore")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseIdentifier = "menuCell"
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? MenuTableViewCell
                    cell?.titleLabel.text = "Title"
                    cell?.ImageView.image = #imageLiteral(resourceName: "default")
                return cell!
            }

    @IBAction func backAction(_ sender: Any) {
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.selectedIndex = 0
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
