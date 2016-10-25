class Recipe
{
    var name : String
    var ingredients : [String]
    var prepTimeInMinutes : Int
    
    init(name :String, ingredients : [String], prepTimeInMinutes : Int) {
        self.name = name
        self.ingredients = ingredients
        self.prepTimeInMinutes = prepTimeInMinutes
    }
    
    subscript (var i : Int) -> String {
        return ingredients[i]
    }
}

var recipe = Recipe(name: "Recipe", ingredients:["Sugar","Apples","Flour"],prepTimeInMinutes: 3)

recipe[2]
