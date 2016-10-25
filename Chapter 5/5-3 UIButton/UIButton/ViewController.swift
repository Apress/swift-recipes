//
//  ViewController.swift
//  UIButton
//
//  Created by Mike Rogers on 1/17/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var button = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        button.frame = CGRect(x: 10, y: 50, width: 200, height: 20)
        button.setTitle("Tap Me!", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        
        button.addTarget(self, action: Selector("tapped:"), forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)
    }

    func tapped(sender : UIButton!) {
        NSLog("tapped")
    }
}

