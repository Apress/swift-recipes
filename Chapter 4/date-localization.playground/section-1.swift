import Foundation
var d = NSDate()var formatter = NSDateFormatter()formatter.dateStyle = NSDateFormatterStyle.LongStyleformatter.timeStyle = NSDateFormatterStyle.LongStyle// No timezone specifiedformatter.stringFromDate(d)formatter.timeZone = NSTimeZone(abbreviation:"UTC")formatter.stringFromDate(d)formatter.timeZone = NSTimeZone(name:"America/New_York")formatter.stringFromDate(d)formatter.timeZone = NSTimeZone(name:"America/Los_Angeles")formatter.stringFromDate(d)formatter.timeZone = NSTimeZone(abbreviation:"GMT")formatter.stringFromDate(d)

formatter.dateStyle = NSDateFormatterStyle.FullStyle
formatter.dateStyle = NSDateFormatterStyle.LongStyle
formatter.dateStyle = NSDateFormatterStyle.MediumStyle
formatter.dateStyle = NSDateFormatterStyle.ShortStyle
formatter.dateStyle = NSDateFormatterStyle.NoStyle
