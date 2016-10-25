import Foundation

var str = "I would like to replace one with one"

str.stringByReplacingOccurrencesOfString("one", withString: "1")

str.stringByReplacingOccurrencesOfString("one", withString: "1",
    
    options: NSStringCompareOptions.CaseInsensitiveSearch)

str.stringByReplacingOccurrencesOfString("one", withString: "1",
    
    options: NSStringCompareOptions.CaseInsensitiveSearch,
    
    range: Range<String.Index>(start: str.startIndex,end: advance(str.startIndex, 27 )))