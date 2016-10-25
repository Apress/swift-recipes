//
//  MockTesting.swift
//  MockTesting
//
//  Created by Mike Rogers on 12/4/14.
//  Copyright (c) 2014 Apress. All rights reserved.
//

import Cocoa
import XCTest

class MockTesting: XCTestCase {
    class MockDb : Database {
        override func getRecords() -> [Record] {
            var records = [Record]()
            records.append( Record(id: 2,data: "Test2"))
            records.append( Record(id: 3,data: "Test3"))
            records.append( Record(id: 1,data: "Test1"))
            
            return records
        }
    }

    func testExample() {
        // Arrange
        var mockDb = MockDb()
        var testTarget = TestMe(db : mockDb)
        
        // Act
        var results = testTarget.getSortedRecords()
        
        // Assert 
        XCTAssertEqual(3, results.count)
        
        // Check that items are in ascending order
        XCTAssertEqual(1, results[0].id)
        XCTAssertEqual(2, results[1].id)
        XCTAssertEqual(3, results[2].id)
    }
}
