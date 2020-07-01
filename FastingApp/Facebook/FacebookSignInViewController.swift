//
//  FacebookSignInViewController.swift
//  FastingApp
//
//  Created by Twinbit Test on 1/7/20.
//  Copyright © 2020 Twinbit. All rights reserved.
//

import UIKit
import FBSDKLoginKit
class FacebookSignInViewController: UIViewController,LoginButtonDelegate {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
         if let token = AccessToken.current,
                   !token.isExpired {
                   // User is logged in, do work such as go to next view controller.
                   let token = token.tokenString
                   let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields" : "email, name"], tokenString: token, version: nil, httpMethod: .get)
                   request.start { (connection, result, error) in
                       print(result)
                   }
                   
               }else{
                   let loginButton = FBLoginButton()
                   loginButton.center = view.center
                   loginButton.delegate = self
                   loginButton.permissions = ["public_profile", "email"]
                   view.addSubview(loginButton)
               }

    }
    
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields" : "email, name"], tokenString: token, version: nil, httpMethod: .get)
        request.start { (connection, result, error) in
            print(result)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }


}
