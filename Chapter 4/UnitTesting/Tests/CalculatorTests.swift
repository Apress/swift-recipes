//
//  Tests.swift
//  Tests
//
//  Created by Mike Rogers on 11/26/14.
//  Copyright (c) 2014 Apress. All rights reserved.
//

import XCTest

class CalculatorTests : XCTestCase {
    func testAdd() {
        // Arrange
        var calc = Calculator()
        // Act
        calc.add(4, b: 2)
        // Assert
        XCTAssertEqual(6, calc.sum, "Sum does not return a + b")
        XCTAssertNotEqual(7, calc.sum, "Sum is incorrect")
    }
}
