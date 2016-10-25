//
//  RestClient.swift
//  RESTApi
//
//  Created by T Michael Rogers on 4/27/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Foundation

public class RestClient {
    
    public class func Get(url : String, callback : (JSON?, NSError?)->()) {
        let url = NSURL(string: url)
        
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) in
            
            if let err = error {
                callback(nil, err)
            }
            
            // attempt to parse
            var parseError : NSError?
            
            var parsedData = JSONParser.parse(data, error: &parseError)
            if let err = parseError {
                callback(nil, err)
            }
            
            callback (parsedData, nil)
        }
        task.resume()
    }
}