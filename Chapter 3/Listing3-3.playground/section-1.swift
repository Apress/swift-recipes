var vehicles = ["Car","Bus","Truck","Plane"]
var vehicle = vehicles[2]

// Insert an item at an index
vehicles.insert("RV",atIndex: 1)
// Insert an array at an index
vehicles.splice(["Quad","Tractor"], atIndex: 3)

// Concatenate 2 arrays
var moreVehicles = ["Boat","Train","Helicopter"]
vehicles += moreVehicles
