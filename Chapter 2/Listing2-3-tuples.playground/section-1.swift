func getAverageMinMax( numbers : [Int32] ) ->
    (average: Int32, min: Int32, max: Int32)
{
    var average : Int32 = 0
    var min = Int32.max
    var max = Int32.min
    
    for i in numbers
    {
        average += i
        if i < min { min = i }
        if i > max { max = i }
    }
    average = average / Int32(numbers.count)
    
    return (average, min, max)
}

var results = getAverageMinMax([1,2,3,10,110,42])

println(results.average)
println(results.min)
println(results.max)
