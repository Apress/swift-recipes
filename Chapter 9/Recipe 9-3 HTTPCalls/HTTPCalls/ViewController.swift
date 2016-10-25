//
//  ViewController.swift
//  HTTPCalls
//
//  Created by T Michael Rogers on 4/27/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://www.google.com")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) in
                println(NSString(data: data, encoding: NSUTF8StringEncoding))
        }
        task.resume()
    }
}

