//
//  Tests.swift
//  Tests
//
//  Created by Mike Rogers on 11/30/14.
//  Copyright (c) 2014 Apress. All rights reserved.
//

import XCTest

class Tests : XCTestCase {
    
    func testPerformanceExample() {
        var performance = Performance()
        
        self.measureBlock() {
            performance.countPrimes()
        }
    }
    
}
