//
//var x = {
//    (y : Int) in
//
//println(y)
//
//}
//
//x(2)

// Closure with no parameters
var foo = { ()-> Int in
    var a = 1

    var b = 3

    return a + b
}

// Closure with parameters
var add = { (a: Int,b: Int) -> Int in return a + b }

add(2,2)

func doSomething( str: String, finished: ()->Void)
{
    println("I did it!")
    
    finished()
}

doSomething("ABCDE", { () in
    println("Finished")
    for i in 1...10
    {
        println(i)
    }
})

// Trailing Closure
doSomething("ABCDE")
{
    () in
    println("Finished")
    for i in 1...10
    {
        println(i)
    }
}
