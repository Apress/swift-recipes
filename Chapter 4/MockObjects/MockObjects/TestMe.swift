// This is the class to be tested
public class TestMe {
    let db : Database
    
    init( db : Database) {
        self.db = db
    }
    
    func getSortedRecords() -> [Record] {
        var results = db.getRecords()
        
        results.sort({ r1, r2 in r1.data < r2.data })
        
        return results
    }
}