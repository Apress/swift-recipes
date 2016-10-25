import Foundation

let decomposedMark : String = "c\u{20DD}"

NSString(format:decomposedMark,NSLocale.currentLocale()).length // returns 2

countElements(decomposedMark) // returns 1