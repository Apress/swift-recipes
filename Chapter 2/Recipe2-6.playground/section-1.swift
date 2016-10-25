class Recipe
{
    var name : String
    var minutesToPrepare : Int
    var ingredients = [String]()
    var recipeType : String {
        return "Basic"
    }
    
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

class DessertRecipe : Recipe
{
    override var recipeType : String {
        return "Dessert"
    }
    
    override func add(amount: Double, cupsOf: String) {
        super.add(amount, cupsOf: cupsOf)
    }
}

var dinner = Recipe(name: "Fish", minutesToPrepare: 15)
var dessert = DessertRecipe(name: "Pie", minutesToPrepare:  30)

println(dinner.recipeType)
println(dessert.recipeType)
