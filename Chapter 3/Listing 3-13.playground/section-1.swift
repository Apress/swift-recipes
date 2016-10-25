struct Vehicle : Hashable
{
    var name : String
    var year : Int
    var numberOfWheels : Int
    
    var hashValue : Int
        {
        get
        {
            return "\(self.name) \(self.year) \(self.numberOfWheels)".hashValue
        }
    }
}

func == (left: Vehicle, right: Vehicle) -> Bool
{
    return left.hashValue == right.hashValue
}

var v = Vehicle(name: "Sedan", year: 2008, numberOfWheels: 4)
v.hashValue
