var d = [1:"One",2:"Two",3:"Three"]

var keyArray = Array(d.keys)

println("Loop and print keys")
for k in d.keys {
    println("The value for key \(k) is \(d[k]!)")
    var value = d[k]!
}

println("Loop and print values")
for v in d.values {
    println("The value is \(v)")
}
