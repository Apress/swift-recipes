//
//  ViewController.swift
//  AutoLayout
//
//  Created by Mike Rogers on 1/18/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var textField = UITextField()
        
        textField.placeholder = "Enter your name"
        textField.borderStyle = UITextBorderStyle.Line
        textField.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addSubview(textField)
        
        var button = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        button.setTitle("Tap Me!", forState: UIControlState.Normal)
        
        button.addTarget(self, action: "tapped:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)
        
        var topGuide = self.topLayoutGuide
        
        let views = ["textField":textField,"button":button,"topGuide":topGuide] as [NSObject : AnyObject]
        
        // height constraint
        let textFieldHeight:Array = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[textField(30)]",
            options: NSLayoutFormatOptions(0),
            metrics: nil,
            views: views)
        
        // vertical position
        let verticalPositions:Array = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[topGuide]-10-[textField]-[button(34)]", options: NSLayoutFormatOptions(0),
            metrics: nil,
            views: views)
        
        // right and left side constraints
        let textFieldHorizontal:Array = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[textField]-10-|",
            options: NSLayoutFormatOptions(0),
            metrics: nil,
            views: views)

        // right and left side constraints
        let buttonHorizontal:Array = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-[button(75)]",
            options: NSLayoutFormatOptions(0),
            metrics: nil,
            views: views)
        
        view.addConstraints(textFieldHeight
            + verticalPositions
            + textFieldHorizontal
            + buttonHorizontal)
    }
    
    func tapped( sender : UIButton )
    {
        NSLog("Tapped")
    }
}

