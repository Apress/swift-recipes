//
//  ViewController.swift
//  NSOperationsQueue
//
//  Created by T Michael Rogers on 3/26/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var serialQueue: NSOperationQueue?
    var mainQueue: NSOperationQueue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainQueue = NSOperationQueue.mainQueue()
        serialQueue = NSOperationQueue()
        serialQueue?.maxConcurrentOperationCount = 1
        
        var progress = UIProgressView(frame: CGRect(x:0,y:0,width: 200, height: 30))
        progress.center = self.view.center
        self.view.addSubview(progress)
        
        serialQueue?.addOperationWithBlock() {
            
            self.mainQueue?.addOperationWithBlock() {
                progress.setProgress(0.0, animated: false)
            }
            
            for i in 1...1000000 {
                if i % 1000 == 0
                {
                    self.mainQueue?.addOperationWithBlock() {
                        var percentDone = Float(i/100000)
                        progress.setProgress(percentDone, animated: true)
                    }
                }
            }
        }
    }
}