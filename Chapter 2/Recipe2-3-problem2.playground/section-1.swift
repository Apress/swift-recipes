class recipe
{
    var name : String
    var minutesToPrepare  : Int
    
    init()
    {
        self.name = "Apple Pie"
        self.minutesToPrepare  = 30
    }
    
    init( name : String, minutesToPrepare  : Int)
    {
        self.name = name
        self.minutesToPrepare  = minutesToPrepare
    }
}
