//
//  ViewController.swift
//  XMLParsing
//
//  Created by T Michael Rogers on 4/22/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var xml = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("recipes", ofType: "xml")!)
        
        var error : NSError?
        
        var doc = SMXMLDocument(data: xml, error: &error)
        
        if error == nil {
            
            
            for recipe in doc.childrenNamed("recipe") {
                var name = recipe.valueWithPath("name")
                var serves = recipe.valueWithPath("serves")
                var preparationTime = recipe.valueWithPath("preparation-time")
                
                println("Recipe name: \(name)")
                println("Serves: \(serves)")
                println("Preparation Time: \(preparationTime)")
            }
            
        } else {
            println("Error parsing xml: \(error?.localizedDescription)")
        }
    }
}

