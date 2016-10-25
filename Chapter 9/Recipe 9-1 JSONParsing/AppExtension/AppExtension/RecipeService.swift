//
//  IngredientService.swift
//  AppExtension
//
//  Created by T Michael Rogers on 4/27/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Foundation

class RecipeService {

    var recipes = [
        "Grilled Fish",
        "Fajitas",
        "Chicken Stir Fry",
        "Hamburger",
        "Fried Chicken",
        "Miso Soup",
        "Lo Mein",
        "Tofu and Rice",
        "Spaghetti and Meatballs",
    ]
    
    func randomRecipe() -> String {
        return recipes[ Int(arc4random_uniform(UInt32(recipes.count))) ]
    }
}
