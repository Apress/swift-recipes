import Foundation

class SimplePoint
{
    var x : Int
    var y : Int
    
    init ( x :Int, y: Int)
    {
        self.x = x
        self.y = y
    }
    
}

func NSArrayToArrayOf<T>(array: NSArray) -> [T]?
{
    var nsArray = NSArray()
    var swiftArray = nsArray as [AnyObject]

    return [T]()
}

var nsarray = NSArray(array:["123","456","789"])

var z : [String] = NSArrayToArrayOf(nsarray)!

