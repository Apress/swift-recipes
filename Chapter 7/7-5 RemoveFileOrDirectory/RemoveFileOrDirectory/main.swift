//
//  main.swift
//  RemoveFileOrDirectory
//
//  Created by Mike Rogers on 2/2/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Foundation

let documentDirs = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String]
let fileToDelete = documentDirs![0].stringByAppendingPathComponent("DeleteMe.txt")
let fileManager = NSFileManager()
var error: NSError?

if fileManager.removeItemAtPath(fileToDelete, error: &error) {
    println("Successfully removed \(fileToDelete).")
} else {
    println("ERROR: \(error?.localizedDescription)")
}

var resultingURL : NSURL?
let fileToTrash = documentDirs![0].stringByAppendingPathComponent("TrashMe.txt")
let urlPath = NSURL(fileURLWithPath: fileToTrash)

if fileManager.trashItemAtURL(urlPath!, resultingItemURL: &resultingURL, error: &error){
    println("Successfully moved \(fileToTrash) to the trash: \(resultingURL)")
} else {
    println("ERROR: \(error?.localizedDescription)")
}

