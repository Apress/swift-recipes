//
//  main.swift
//  DeepListFiles
//
//  Created by T Michael Rogers on 2/3/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Foundation

let fileManager = NSFileManager()
let path = "~/Documents/Fonts".stringByExpandingTildeInPath
var error : NSError?

let deepContents = fileManager.subpathsOfDirectoryAtPath(path, error: &error)
if let files = deepContents {
    for f in files as! [String] {
        println("File: \(f)")
    }
} else {
    println("Error: \(error?.localizedDescription)")
}

