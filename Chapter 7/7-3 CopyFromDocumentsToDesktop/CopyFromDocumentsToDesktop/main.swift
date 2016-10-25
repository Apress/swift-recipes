//
//  main.swift
//  CopyFromDocumentsToDesktop
//
//  Created by Mike Rogers on 2/1/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Foundation

let documentDirs = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String]


let desktopDirs = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DesktopDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String]



if documentDirs?.count > 0 && desktopDirs?.count > 0
{
    println("Documents directory is \(documentDirs![0])")
    println("Desktop directory is \(desktopDirs![0])")
    
    let sourceFile = documentDirs![0].stringByAppendingPathComponent("CopyMe.txt")
    let destinationFile = desktopDirs![0].stringByAppendingPathComponent("CopyMe.txt")

    let fileManager = NSFileManager()

    var error: NSError?

    if fileManager.copyItemAtPath(sourceFile, toPath: destinationFile, error: &error) {
        println("Successfully copied \(sourceFile) to \(destinationFile).")
    }else {
        println("ERROR: \(error?.localizedDescription)")
    }
}
else
{
    println("System failed to return a valid path for the Documents or Desktop folders.")
}
