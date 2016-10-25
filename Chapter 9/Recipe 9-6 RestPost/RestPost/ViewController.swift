//
//  ViewController.swift
//  RestPost
//
//  Created by T Michael Rogers on 4/27/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var data: [String: AnyObject] = [ "name" : "Pea Soup", "Ingredients" : "Split Peas, Water, Chicken Broth, Milk, Salt, Onions" ]
        
        RestClient.Post("http://echo.jsontest.com/status/OK", data: data)
        { (json, error) -> Void in
            
            if let err = error {
                println("Error: \(error?.localizedDescription)")
                return
            }
            
            if let j = json {
                var status = j["status"]?.stringValue
                
                println("Status: \(status!)")
            }
        }
    }
}

