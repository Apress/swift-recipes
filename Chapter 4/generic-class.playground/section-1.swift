class LIFOStack<T>
{
    var items : [T]
    
    init()
    {
        items = [T]()
    }
    
    func push(item : T)
    {
        items.insert(item, atIndex: 0)
    }
    
    func pop() -> T?
    {
        if items.count == 0
        {
            return nil
        }
        var item = items[0]
        items.removeAtIndex(0)
        return item
    }
}

var lifo = LIFOStack<String>()

lifo.push("Apple")
lifo.push("Pear")
lifo.push("Peach")

println(lifo.pop())
println(lifo.pop())
println(lifo.pop())
println(lifo.pop())

