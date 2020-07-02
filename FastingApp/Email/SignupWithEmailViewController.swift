//
//  SignupWithEmailViewController.swift
//  FastingApp
//
//  Created by Twinbit Test on 1/7/20.
//  Copyright © 2020 Twinbit. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignupWithEmailViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func signUpAction(_ sender: Any) {
        let email = emailField.text
        let password = passwordField.text
        if let email = email,let password = password{
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                //print(result)
                
            }
            
        }
    }
    
}
