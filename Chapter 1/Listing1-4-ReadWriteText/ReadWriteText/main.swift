import Foundation

let fullPath = "/tmp/SwiftText.txt"

var error : NSError?
var text = NSString(contentsOfFile: fullPath, encoding: NSUTF8StringEncoding, error: &error)

if let err = error
{
    println("Error reading file \(fullPath): \(err.description)")
}
    else
    if let contents = text
{
    println("Success: \(contents)")
}

text = "0987654321"

error = nil

text?.writeToFile(fullPath, atomically: false, encoding: NSUTF8StringEncoding, error: &error)

if let err = error
{
    println("Error writing file \(fullPath): \(err.description)")
}
