//
//  main.swift
//  NSKeyedArchiver
//
//  Created by T Michael Rogers on 2/12/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//
import Foundation

var ingredients = ["Flour","Milk","Eggs","Sugar"]
NSKeyedArchiver.archiveRootObject(ingredients, toFile: "/tmp/ingredients.bin")


var newIngredientList = NSKeyedUnarchiver.unarchiveObjectWithFile("/tmp/ingredients.bin") as? [String]

if let loadedIngredients = newIngredientList
{
    println("\(loadedIngredients.count)")
}
else
{
    println("Failed to load object")
}
