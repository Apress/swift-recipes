class Recipe
{
    var serves : Int {
        willSet( newServes ) {
            println("Will set to \(newServes)")
        }
        didSet {
            println("Did set")
        }
    }
    
    init () {
        serves = 0
    }
}

var g = Recipe()
g.serves = 3
