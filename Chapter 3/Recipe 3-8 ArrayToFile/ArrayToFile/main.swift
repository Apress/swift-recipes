import Foundation

var ingredients = ["Apples","Brown Sugar","Eggs", "Butter"]

var nsarray : NSArray = ingredients

let fullPath = "/tmp/ingredients-array.plist"

if !nsarray.writeToFile(fullPath, atomically: true)
{
    println("Error writing array file \(fullPath)")
}
else
{
    println("Successfully wrote to file")
}




