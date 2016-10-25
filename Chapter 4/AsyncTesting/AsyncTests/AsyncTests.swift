//
//  AsyncTests.swift
//  AsyncTests
//
//  Created by Mike Rogers on 12/15/14.
//  Copyright (c) 2014 Apress. All rights reserved.
//

import Cocoa
import XCTest

class AsyncTests: XCTestCase {
    
    func testFoo() {
        
        let expectation = expectationWithDescription("NSURLSession.dataTaskWithURL")
        
        let url = NSURL(string: "http://www.google.com")
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url!) {
            (data: NSData!, response:NSURLResponse!,
            error: NSError!) -> Void in
                expectation.fulfill()
                XCTAssertNotNil(data, "data should not be null")
                XCTAssertNil(error, "error should be null")
        }
        dataTask.resume()
        
        waitForExpectationsWithTimeout(30, handler: nil)
    }
}
