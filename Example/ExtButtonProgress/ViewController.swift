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
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
    }
    
    @IBAction func start(_ sender: Any) {
        button.showProgressIndicator(width: 5, color: UIColor.red, backgroundColor: UIColor.blue)
    }
    
    @IBAction func stop(_ sender: Any) {
        button.hideProgressIndicator()
    } 
}
