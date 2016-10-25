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

// sort with closure
complexArray.sort({ p1, p2 in p1.year < p2.year }) // Ascending
complexArray.sort({ p1, p2 in p1.year > p2.year }) // Descending

// sort with function
func sortYearAscending( v1 : Vehicle, v2 : Vehicle)-> Bool
{
    return v1.year < v2.year
}

func sortNameAscending( v1 : Vehicle, v2 : Vehicle)-> Bool
{
    return v1.name < v2.name
}

complexArray.sort(sortYearAscending)
complexArray.sort(sortNameAscending)
