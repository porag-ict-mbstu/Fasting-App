//
//  ViewController.swift
//  FastingApp
//
//  Created by Twinbit Test on 30/6/20.
//  Copyright © 2020 Twinbit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func appleSignIn(_ sender: Any) {
        let vc = AppleSignInViewController(nibName: "AppleSignInViewController", bundle: nil) as AppleSignInViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func emailsignIn(_ sender: Any) {
        let vc = EmailSignInViewController(nibName: "EmailSignInViewController", bundle: nil) as EmailSignInViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func googleSignIn(_ sender: Any) {
        let vc = GoogleSignInViewController(nibName: "GoogleSignInViewController", bundle: nil) as GoogleSignInViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func facebookSignIn(_ sender: Any) {
        let vc = FacebookSignInViewController(nibName: "FacebookSignInViewController", bundle: nil) as FacebookSignInViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

