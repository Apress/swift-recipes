//
//  ViewController.swift
//  UITextField
//
//  Created by Mike Rogers on 1/17/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var textField = UITextField(frame: CGRect(x: 10, y: 50, width: 300, height: 30))
        
        textField.placeholder = "Enter your name"
        textField.font = UIFont(name: "Arial-BoldMT", size: 22)
        //textField.borderStyle = UITextBorderStyle.Line
        
        view.addSubview(textField)
    }
}

