//
//  main.swift
//  CreateDirectory
//
//  Created by Mike Rogers on 2/1/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Foundation

let documentDirs = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String]

if documentDirs?.count > 0
{
    println("Documents directory is \(documentDirs![0])")
    
    let newDirectoryPath = documentDirs![0].stringByAppendingPathComponent("Swift/Recipes")
    
    let fileManager = NSFileManager()
    
    var error: NSError?
    
    if fileManager.createDirectoryAtPath(newDirectoryPath, withIntermediateDirectories: true, attributes: nil, error: &error) {
        println("Successfully created \(newDirectoryPath).")
    }else {
        println("ERROR: \(error?.localizedDescription)")
    }
}
else
{
    println("System failed to return a valid path for the Documents or Desktop folders.")
}

