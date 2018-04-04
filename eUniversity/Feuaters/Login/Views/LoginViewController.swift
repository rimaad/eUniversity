//
//  LoginViewController.swift
//  eUniversity
//
//  Created by Damir Ramic on 11/01/2018.
//  Copyright © 2018 Damir Ramich. All rights reserved.
//

import UIKit
import SVProgressHUD


class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserController.sharedController.delegate = self
        assignBackground()
        makeButtonRounded()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func assignBackground(){
       
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "background_signin")
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
    
    func makeButtonRounded() {
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
    }
    

    @IBAction func loginPressed(_ sender: Any) {
        SVProgressHUD.show()
        if let username = usernameTextField.text, let password = passwordTextField.text {
            UserController.sharedController.delegate = self
            UserController.sharedController.login(userName: username, password: password)
        }
    }
}

extension LoginViewController:UserControllerDelegate {
    
    func onSuccess() {
        SVProgressHUD.dismiss()
       // let storyBoard = UIStoryboard(name:"Main", bundle:nil)
       // let filterVC = storyBoard.instantiateViewController(withIdentifier: "tabBar")
       // self.present(filterVC, animated: true, completion: nil)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "tabBar") as! UITabBarController
        navigationController?.pushViewController(vc,animated: true)
    }
    
    func onError(error: eUniversityError){
        let eUniversityerror = eUniversityError()
        eUniversityerror.showErrorMessage(message:error.exceptionMessage ?? "something_went_wrong".localized())
        SVProgressHUD.dismiss()
       
}

}

