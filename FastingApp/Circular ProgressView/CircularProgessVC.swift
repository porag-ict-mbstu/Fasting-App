//
//  CircularProgessVC.swift
//  FastingApp
//
//  Created by Twinbit Test on 2/7/20.
//  Copyright © 2020 Twinbit. All rights reserved.
//

import UIKit

class CircularProgessVC: UIViewController {

    @IBOutlet weak var circularProgress: CircularProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        circularProgress.trackClr = UIColor.cyan
        circularProgress.progressClr = UIColor.purple
    }

    @IBAction func btn95(_ sender: Any) {
        circularProgress.setProgressWithAnimation(duration: 1.0, value: 0.95)
    }
    @IBAction func btn30(_ sender: Any) {
        circularProgress.setProgressWithAnimation(duration: 1.0, value: 0.30)
    }
    @IBAction func btn60(_ sender: Any) {
        circularProgress.setProgressWithAnimation(duration: 1.0, value: 0.60)
    }
}
