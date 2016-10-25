//
//  JSONParser.swift
//  JSONParsing
//
//  Created by T Michael Rogers on 4/21/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Foundation

class JSONParser {
    
    class func parse(data : NSData, inout error: NSError?) -> JSON? {
        
        var parsedObject : AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error)
        
        
        if let obj: AnyObject = parsedObject  {
            return JSON( parsedObject: obj )
        }
        
        return nil // error state
    }
    
}