//
//  ViewController.swift
//  GCD
//
//  Created by T Michael Rogers on 2/15/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: 200.0, height: 20.0))
        label.center = self.view.center
        label.text = "Loading..."
        self.view.addSubview(label)
        
        // queue a long running task
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.longRunningTask()
        }
        
    }
    
    func longRunningTask() {
        sleep(3)
        dispatch_async(dispatch_get_main_queue()) {
            self.label.text = "Complete."
        }
    }
}

