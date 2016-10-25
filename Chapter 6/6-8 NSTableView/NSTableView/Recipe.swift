//
//  Recipe.swift
//  NSTableView
//
//  Created by T Michael Rogers on 3/22/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Foundation

class Recipe {
    var recipeName : String
    var preparationTime : Int
    
    init(recipeName : String, preparationTime: Int)
    {
        self.recipeName = recipeName
        self.preparationTime = preparationTime
    }
}