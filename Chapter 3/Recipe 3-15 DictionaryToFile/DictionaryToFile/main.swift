//
//  main.swift
//  DictionaryToFile
//
//  Created by Mike Rogers on 11/13/14.
//  Copyright (c) 2014 T. Michael Rogers. All rights reserved.
//

import Foundation

var dictionary = [ "1":"One", "2":"Two", "3":"Three"]

var nsDictionary : NSDictionary = dictionary

let fullPath = "/tmp/numbers-strings.plist"

if !nsDictionary.writeToFile(fullPath, atomically: true)
{
    println("Error writing dictionary file \(fullPath)")
}
else
{
    println("Successfully wrote to file")
}

