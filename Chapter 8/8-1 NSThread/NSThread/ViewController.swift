//
//  ViewController.swift
//  NSThread
//
//  Created by T Michael Rogers on 2/13/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit
import Foundation

@objc class MyThreadClass {
    func threadMethod(object : AnyObject?)
    {
        for i in 1...1000
        {
            println("Thread Loop Iteration #\(i)")
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var myInstance = MyThreadClass()
        
        // Create thread using detachNewThreadSelector:toTarget:withObject:
        NSThread.detachNewThreadSelector("threadMethod:", toTarget: myInstance, withObject: nil)
        
        // Create thread using init(target:selector:object)
        var thread = NSThread(target: myInstance, selector: "threadMethod:", object: nil)
        thread.stackSize = 16000
        thread.threadPriority = 0.75
        thread.start()
    }
}

