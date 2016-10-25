//
//  main.swift
//  NSCoding
//
//  Created by T Michael Rogers on 2/12/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Foundation

var orders : [Order] = []

orders.append(Order(date: NSDate(), pricePerItem: 2.50, quantity: 99, notes: "Trinkets"))
orders.append(Order(date: NSDate(), pricePerItem: 100.00, quantity: 2, notes: "Expensive Items"))
orders.append(Order(date: NSDate(), pricePerItem: 20000.00, quantity: 1, notes: "Car"))
    
NSKeyedArchiver.archiveRootObject(orders, toFile: "/tmp/orders.bin")

var loadedOrders = NSKeyedUnarchiver.unarchiveObjectWithFile("/tmp/orders.bin") as? [Order]

if let theOrders = loadedOrders
{
    for order in theOrders
    {
        println("(\(order.quantity)) \(order.notes)")
    }
}
else
{
    println("Failed to load object")
}