//
//  EmailViewController.swift
//  FastingApp
//
//  Created by Twinbit Test on 2/7/20.
//  Copyright © 2020 Twinbit. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController {

    var otp = ""
    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



    @IBAction func submitAction(_ sender: Any) {
        
        guard let text = self.emailField.text, text.isEmpty == false else {
            
            self.inValiadMailAnimation()
            return
        }
        
        if self.isEmailValid(text) {
            
            self.SendMail()
            
        }else{
            
            self.inValiadMailAnimation()
        }
        
    }
    
    
    
    
    
    
}


extension EmailViewController{
    private func getURL(type : String)->URL?{
            
            
            if type == "sendmail" {
                
                guard let email = self.emailField.text , email.isEmpty == false else { return nil }
                
                self.otp = "\(arc4random_uniform(9999))"
                
                let str = "http://www.twinbit.net/photovault/verify.php?user_id=\(email)&passcode=\(self.otp)&time=100"
                
                guard let url = URL(string: str)  else { return nil}
                
                return url
                
            }
            return nil
        }
    
    
    
    
    
    
    
    private func SendMail(){
            
            
            
            //self.activityIndicator.startAnimating()
            
            
            
            guard let url = self.getURL(type: "sendmail") else {
                
                DispatchQueue.main.async {
                    
                    //self.activityIndicator.stopAnimating()
                }
                
                
                return
            }
            
            var request = URLRequest(url: url)
            
            request.httpMethod = "GET"
            
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            
            
            
            let task = URLSession.shared.dataTask(with: request){ requestData, requestResponse, error in
                
                guard let response = requestResponse as? HTTPURLResponse  else { return }
                
                
                if response.statusCode == 200 {
                    
                    
                    
                    self.goToNextVC()
                    print(self.otp)
                    
                    
                }
                
                
                
            }
            
            task.resume()
            
            
            
            
        }
    
    
    
    private func goToNextVC(){
        
        DispatchQueue.main.async {
            
            
            guard let text = self.emailField.text, text.isEmpty == false else { return }
            
            let vc = OTPViewController(nibName: "OTPViewController", bundle: nil) as OTPViewController
            vc.otp = self.otp
            vc.email = text
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        }
        
        
        
        print("Inside next vc")
        
    }
    
    
    
    
    public func isEmailValid(_ email: String) -> Bool {
        
        let emailRegEx =  "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$"
        
        var returnValue = true
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx, options: .caseInsensitive)
            
            let nsString = email as NSString
            
            let results = regex.matches(in: email, range: NSRange(location: 0, length: nsString.length))
            
            print("Email validation  result : \(results) ")
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return returnValue
    }
    
    
    private func inValiadMailAnimation(){
        
        UIView.animate(withDuration: 0.5, animations: {
            
            //self.lblInvalidMail.alpha = 1
            
        }) { (suucess) in
            
            UIView.animate(withDuration: 0.3, delay: 1, options: .curveEaseInOut, animations: {
                
                //self.lblInvalidMail.alpha = 0
                
            }, completion: nil)
            
        }
        
    }

}
