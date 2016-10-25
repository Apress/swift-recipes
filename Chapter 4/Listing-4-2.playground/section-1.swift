// The second parameter is a closure without a return value
func doSomething( str: String, finished: ()->Void) {
    println("I did it!")
    
    finished()
}

// Trailing Closure
doSomething("ABCDE") { () in
    
    println("Finished")
    for i in 1...10 {
        println(i)
    }
}