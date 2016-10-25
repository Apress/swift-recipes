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

func areEqual<T : Equatable> (a : T, b : T) -> Bool
{
    return a == b
}


areEqual(22, 99)
areEqual("Apple", "Apple")

