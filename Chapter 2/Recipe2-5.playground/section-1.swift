class Recipe
{
    var name : String
    var minutesToPrepare  : Int
    var ingredients = [String]()
    
    init( name : String, minutesToPrepare  : Int) {
        self.name = name
        self.minutesToPrepare  = minutesToPrepare
    }
    
    func add( amount : Double, cupsOf : String  ) {
        ingredients.append(cupsOf)
    }
    
    class func convertOuncesToCups( ounces : Double) -> Double {
        return ounces / 8
    }
}

var applePie = Recipe(name:"Apple Pie", minutesToPrepare: 30)
applePie.add(2, cupsOf: "Apples")
Recipe.convertOuncesToCups(16)
