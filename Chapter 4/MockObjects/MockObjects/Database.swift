class Record {
    let id : Int
    var data : String
    
    init(id : Int, data : String)
    {
        self.id = id
        self.data = data
    }
}

class Database {
    
    func getRecords() -> [Record] {
        // Pretend this connects to a database and returns records
        return [Record]()
    }
}