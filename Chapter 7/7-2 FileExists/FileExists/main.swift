import Foundation

let filepath = "~/FindMe.txt".stringByExpandingTildeInPath

// Check for a file
if NSFileManager().fileExistsAtPath(filepath) {
    println("File exists at path \(filepath)")
} else {
    println("File does not exist")
}

// Check for a directory
let directoryPath = "~/recipes".stringByExpandingTildeInPath
var isDir : ObjCBool = true

if NSFileManager().fileExistsAtPath(directoryPath, isDirectory: &isDir){
    println("Directory exists at path \(directoryPath)")
} else {
    println("Directory does not exist")
}
