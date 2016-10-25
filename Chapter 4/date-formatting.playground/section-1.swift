// Playground - noun: a place where people can play

import Foundation
var d = NSDate()var formatter = NSDateFormatter()formatter.dateStyle = NSDateFormatterStyle.LongStyleformatter.timeStyle = NSDateFormatterStyle.LongStyle// No timezone specifiedformatter.stringFromDate(d)formatter.timeZone = NSTimeZone(abbreviation:"UTC")formatter.stringFromDate(d)formatter.timeZone = NSTimeZone(name:"America/New_York")formatter.stringFromDate(d)formatter.timeZone = NSTimeZone(name:"America/Los_Angeles")formatter.stringFromDate(d)formatter.timeZone = NSTimeZone(abbreviation:"GMT")formatter.stringFromDate(d)


