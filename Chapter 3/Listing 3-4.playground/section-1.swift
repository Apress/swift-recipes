// Create an array of vehicle names
var vehicles = ["Car","Bus","Truck","Plane"]
// Filter for items that match the string "Car"
var matches = vehicles.filter({ c in c == "Car" })

struct Vehicle
{
    var name : String
    var year : Int
    var numberOfWheels : Int
}

var complexArray = [
    Vehicle(name: "Sedan", year: 2008, numberOfWheels: 4),
    Vehicle(name: "Motorcycle", year: 2008, numberOfWheels: 2),
    Vehicle(name: "Tractor", year: 2010, numberOfWheels: 4),
    Vehicle(name: "Trike", year: 2000, numberOfWheels: 3)
]
// filter on one property
var results = complexArray.filter({ v in v.year >= 2008 })
// filter on multiple properties
var moreResults = complexArray.filter({ v in v.year >= 2008 && v.numberOfWheels == 4 })
