//
//  ViewController.swift
//  UIAlertController
//
//  Created by Mike Rogers on 1/31/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(animated: Bool) {
        let baconAlert = UIAlertController(title: "More Bacon?", message: "Would you like some more bacon?", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "No", style: .Cancel) { (action) in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        baconAlert.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Yes", style: .Default) { (action) in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        baconAlert.addAction(OKAction)
        
        let NoMoreBacon = UIAlertAction(title: "Don’t ask again", style: .Destructive) { (action) in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        baconAlert.addAction(NoMoreBacon)
        
        self.presentViewController(baconAlert, animated: true, completion: nil)
    }
}

