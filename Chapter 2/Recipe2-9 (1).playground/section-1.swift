enum Measure{    case Cup(Double)    case Tablespoon (Double)    case Ounce (Double)    case Quantity (Int)
    
    func convertToOunces(measure : Measure) -> Measure {        switch (measure) {            case .Cup(let val):                return Ounce(val * 8)            case .Tablespoon(let val):                return Ounce(val * 0.5)            default:                return measure        }    }}

enum PreparationStyle{    case Whip(String, Measure)    case Boil(String, Measure)
    
    func instructions (prepartionStyle : PreparationStyle ) -> String {
    
        switch (prepartionStyle) {
            case .Whip(let name, let measure):
                return "Whip \(name)"
            case .Boil(let name, let measure):
                return "Boil \(name)"
        }
    }}var twoCups = Measure.Cup(2)var eggs = PreparationStyle.Whip("Eggs", Measure.Quantity(2))

PreparationStyle.instructions(eggs)
////struct Ingredient {//    var preparationStyle : PreparationStyle//    var preparationInstructions : String//}////var eggs = Ingredient(preparationStyle: PreparationStyle.Whipped("Eggs",
//        Measure.Quantity(2)),
//        preparationInstructions: "Whip eggs in a bowl and set aside")