import Foundation

let fullPath = "/tmp/numbers-strings.plist"

var dictionary = NSDictionary(contentsOfFile: fullPath) as Dictionary<String,String>?

if let numbersDictionary = dictionary
{
    for k in numbersDictionary.keys
    {
        println("The value for key \(k) is \(numbersDictionary[k]!).")
    }
}
else
{
    println("Could not load dictionary from plist: \(fullPath)")
}