//
//  ViewController.swift
//  UILabelApp
//
//  Created by Mike Rogers on 1/10/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var label = UILabel(frame: CGRect(x: 10, y: 50, width: 200, height: 20))
        label.text = "Swift Recipes"
        view.addSubview(label)
    }
}

