//
//  OTPViewController.swift
//  FastingApp
//
//  Created by Twinbit Test on 2/7/20.
//  Copyright © 2020 Twinbit. All rights reserved.
//

import UIKit

class OTPViewController: UIViewController {

    @IBOutlet weak var otpTextField: UITextField!
    var otp:String?
    var email:String?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    @IBAction func checkOtp(_ sender: Any) {
        guard let otpText = otpTextField.text,let otp = otp else {
            return
        }
        if otp == otpText{
            print("Success")
        }else{
            print("Wrong OTP")
        }
    }
    

}
