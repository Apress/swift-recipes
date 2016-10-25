import Foundation

// String extension to parse numbers using NSSTring
extension String
{
    func toDouble() -> Double?
    {
        let num = NSString(string: self)
        
        return num.doubleValue
    }
    
    func toFloat() -> Float?
    {
        let num = NSDecimalNumber(string: self, locale: NSLocale.currentLocale())
        return num.floatValue
    }
}

// Examples
"100.5039487283993".toDouble()

"0.289".toFloat()