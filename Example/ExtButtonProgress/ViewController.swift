//
//  ViewController.swift
//  ExtButtonProgress
//
//  Created by npu3pak on 03/21/2017.
//  Copyright (c) 2017 npu3pak. All rights reserved.
//

import UIKit
import ExtButtonProgress

class ViewController: UIViewController {
    @IBOutlet var roundedButton: UIButton!
    
    let indicatorColor = UIColor.white
    let indicatorBackgroundColor = UIColor(red: 156/255, green: 178/255, blue: 206/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedButton.layer.cornerRadius = 25
        roundedButton.clipsToBounds = true
    }
    
    func showProgressIndicator() {
        roundedButton.showProgressIndicator(width: 10, color: indicatorColor, backgroundColor: indicatorBackgroundColor, cycleDuration: 7.0)
    }
    
    func hideProgressIndicator() {
        roundedButton.hideProgressIndicator()
    }
    
    @IBAction func start(_ sender: Any) {
        showProgressIndicator()
    }
    
    @IBAction func stop(_ sender: Any) {
        hideProgressIndicator()
    }
    
    @IBAction func onRoundedButtonPress(_ sender: Any) {
        if roundedButton.isProgressIndicatorVisible {
            hideProgressIndicator()
        } else {
            showProgressIndicator()
        }
    }
}
