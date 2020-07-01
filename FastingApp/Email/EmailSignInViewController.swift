//
//  EmailSignInViewController.swift
//  FastingApp
//
//  Created by Twinbit Test on 1/7/20.
//  Copyright © 2020 Twinbit. All rights reserved.
//

import UIKit
import FirebaseAuth

class EmailSignInViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    override func viewWillAppear(_ animated: Bool) {
        if FirebaseAuth.Auth.auth().currentUser != nil{
            let vc = HomeViewController(nibName: "HomeViewController", bundle: nil) as HomeViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    @IBAction func loginAction(_ sender: Any) {
        let email = emailField.text
        let password = passwordField.text
        if let email = email,let password = password{
         
            FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error != nil{
                    let vc = SignupWithEmailViewController(nibName: "SignupWithEmailViewController", bundle: nil) as SignupWithEmailViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                else{
                    print("Logged In")
                    let vc = HomeViewController(nibName: "HomeViewController", bundle: nil) as HomeViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
            
        }
    }
    
    

}
