//
//  Ingredient.swift
//  RecipeBook
//
//  Created by T Michael Rogers on 5/2/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Foundation
import CoreData

class Ingredient: NSManagedObject {

    @NSManaged var ingredient: String
    @NSManaged var measurement: NSNumber
    @NSManaged var parentRecipe: Recipe

}
