import Foundation

let fullPath = "/tmp/ingredients-array.plist"

var ingredients = NSArray(contentsOfFile: fullPath) as [String]?

if let ingredientsArray = ingredients
{
    for ingredient in ingredientsArray
    {
        println(ingredient)
    }
}
else
{
    println("Could not load plist")
}
