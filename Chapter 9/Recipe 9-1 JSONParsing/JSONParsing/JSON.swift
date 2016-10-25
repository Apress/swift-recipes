//
//  ParseJSON.swift
//  JSONParsing
//
//  Created by T Michael Rogers on 4/11/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Foundation

public class JSON
{
    public var error : NSError?

    private var parsedObject : AnyObject
    
    init ( parsedObject : AnyObject ) {
        self.parsedObject = parsedObject
    }
    
    subscript(index : Int) -> JSON? {
        if let item = parsedObject as? NSArray {
            if index > item.count { return nil }
            
            return JSON(parsedObject: item[index])
        }
        else { return nil }
    }
    
    subscript(key : String) -> JSON? {
        if let item = parsedObject as? NSDictionary {
            if item[key] != nil {
                return JSON(parsedObject: item[key]!)
            }
        }
        return nil
    }
    
    var stringValue : String? { get { return parsedObject as? String } }
    
    var intValue : Int? { get { return parsedObject as? Int } }
}