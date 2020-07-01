//
//  AppleSignInViewController.swift
//  FastingApp
//
//  Created by Twinbit Test on 1/7/20.
//  Copyright © 2020 Twinbit. All rights reserved.
//

import UIKit
import AuthenticationServices

class AppleSignInViewController: UIViewController {

    let appleProvider = AppleSignInClient()

     override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
         
         let appleBtn = ASAuthorizationAppleIDButton()
         self.view.addSubview(appleBtn)
         appleBtn.addTarget(self, action: #selector(SignInWithAppleAction(sender:)), for: .touchUpInside)
         appleBtn.center =  self.view.center
         
     }

     
     
     @objc
     func SignInWithAppleAction(sender: ASAuthorizationAppleIDButton)  {
         
         appleProvider.handleAppleIdRequest(block: { fullName, email, token in
             // receive data in login class.
             
             
             
         })
    
     
     }

}
