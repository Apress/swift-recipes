//
//  main.swift
//  ListFiles
//
//  Created by Mike Rogers on 2/3/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Foundation

let fileManager = NSFileManager()
let path = "~".stringByExpandingTildeInPath
var error : NSError?
let contents = fileManager.contentsOfDirectoryAtPath(path, error: &error)

if let files = contents {
    for f in files as! [String] {
        println("File: \(f)")
    }
} else {
    println("Error: \(error?.localizedDescription)")
}