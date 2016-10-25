//
//  ViewController.swift
//  RESTApi
//
//  Created by T Michael Rogers on 4/27/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        RestClient.Get("https://openlibrary.org/works/OL11315329W.json")
        { (json, error) -> Void in
            
            if let err = error {
                println("Error: \(error?.localizedDescription)")
                return
            }
            
            if let j = json {
                
                var title = j["title"]?.stringValue
                var revision = j["revision"]?.intValue
                
                
                println("Title: \(title!)")
                println("Revision: \(revision!)")
            }
        }
    }
}

