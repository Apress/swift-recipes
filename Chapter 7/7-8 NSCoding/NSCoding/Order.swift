//
//  Invoice.swift
//  NSCoding
//
//  Created by T Michael Rogers on 2/12/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Foundation

enum OrderFields : String
{
    case Date = "date",
    PricePerItem = "pricePerItem",
    Quantity = "quantity",
    Notes = "notes"
}

class Order : NSObject, NSCoding
{
    var date : NSDate
    var pricePerItem: Float
    var quantity : Int
    var notes : String
    
    init( date : NSDate, pricePerItem : Float, quantity : Int, notes: String)
    {
        self.date = date
        self.pricePerItem = pricePerItem
        self.quantity = quantity
        self.notes = notes
    }
    
    required init(coder aDecoder: NSCoder) {
        
        date = aDecoder.decodeObjectForKey(OrderFields.Date.rawValue) as! NSDate
        pricePerItem = aDecoder.decodeFloatForKey(OrderFields.PricePerItem.rawValue)
        quantity = aDecoder.decodeIntegerForKey(OrderFields.Quantity.rawValue)
        notes = aDecoder.decodeObjectForKey(OrderFields.Notes.rawValue) as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(date,forKey: OrderFields.Date.rawValue)
        aCoder.encodeFloat(pricePerItem, forKey: OrderFields.PricePerItem.rawValue)
        aCoder.encodeInteger(quantity, forKey: OrderFields.Quantity.rawValue)
        aCoder.encodeObject(notes,forKey: OrderFields.Notes.rawValue)
    }
}