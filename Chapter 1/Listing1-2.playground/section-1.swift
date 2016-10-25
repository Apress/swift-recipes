import Foundation

let filename = "SwiftText.txt"
// iOS File Path Code
let directories : [String]? = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String]

var directory : String
var fullPath : String = ""

// Write to file
if let directories = directories {
    directory = directories[0]; //documents directory
    fullPath = directory.stringByAppendingPathComponent(filename);
}
else
{
    println("Err: This is an error state, we could not determine the documents directory path.")
    abort() // Handle this properly in your production code
}

let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

var error : NSError?

alphabet.writeToFile(fullPath, atomically: false, encoding: NSUTF8StringEncoding, error: &error)

if let err = error
{
    println("Error reading file: \(err.description)")
}
