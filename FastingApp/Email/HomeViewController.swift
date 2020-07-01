//
//  HomeViewController.swift
//  FastingApp
//
//  Created by Twinbit Test on 1/7/20.
//  Copyright © 2020 Twinbit. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func logoutAction(_ sender: Any) {
        do{
            try FirebaseAuth.Auth.auth().signOut()
            self.navigationController?.popViewController(animated: true)
        }catch{
            print("Error")
        }
    }

}
