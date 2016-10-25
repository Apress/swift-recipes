//
//  ViewController.swift
//  SynchronizingThreads
//
//  Created by T Michael Rogers on 3/26/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

@objc class MyThreadClass {
    func threadMethod(object : AnyObject?)
    {
        
        for i in 1...1000
        {
            objc_sync_enter(object)
            println("Loop Iteration #\(i)")
            objc_sync_exit(object)
        }
        
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var myInstance = MyThreadClass()
        
        // Create thread using detachNewThreadSelector:toTarget:withObject:
        NSThread.detachNewThreadSelector("threadMethod:", toTarget: myInstance, withObject: myInstance)
        
        // Create thread using init(target:selector:object)
        var thread = NSThread(target: myInstance, selector: "threadMethod:", object: myInstance)
        thread.stackSize = 16000
        thread.threadPriority = 0.75
        thread.start()
    }
}


