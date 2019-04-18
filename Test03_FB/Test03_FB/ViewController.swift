//
//  ViewController.swift
//  Test03_FB
//
//  Created by ddwolf on 2019/4/18.
//  Copyright © 2019 ddwolf. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController,FBSDKLoginButtonDelegate {

    
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let btnFBLogin = FBSDKLoginButton()
        btnFBLogin.readPermissions = ["public_profile", "email"]
        btnFBLogin.delegate = self
        
        
        btnFBLogin.center = self.view.center
        self.view.addSubview(btnFBLogin)
        
        if FBSDKAccessToken.current() != nil{
            self.lblStatus.text = "LOGGED IN"
        }else{
            self.lblStatus.text = "not logged in"
        }
        
        
    }

    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil{
            self.lblStatus.text = error.localizedDescription
        }else if result.isCancelled{
            self.lblStatus.text = "User cancelled log in"
        }else{
            //successfull login
            
            self.lblStatus.text = "User Logged in"
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        self.lblStatus.text = "User Logged Out"
    }
}

