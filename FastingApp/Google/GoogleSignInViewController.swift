//
//  GoogleSignInViewController.swift
//  FastingApp
//
//  Created by Twinbit Test on 1/7/20.
//  Copyright © 2020 Twinbit. All rights reserved.
//

import UIKit
import GoogleSignIn

class GoogleSignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.googleSignIn()
    }


    func googleSignIn()  {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        
        if GIDSignIn.sharedInstance()?.currentUser != nil{
            
        }else{
            GIDSignIn.sharedInstance()?.signIn()
        }
    }
}
