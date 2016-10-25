import Foundation

// Create date with current date and time
var d = NSDate()

// Create NSDateFormatter instance used to set
// the style of date and time and provides methods to format NSDate objects
var formatter = NSDateFormatter()
formatter.dateStyle = NSDateFormatterStyle.LongStyle
formatter.timeStyle = NSDateFormatterStyle.LongStyle

// No timezone specified
formatter.stringFromDate(d)

// New York time zone
formatter.timeZone = NSTimeZone(name:"America/New_York")
formatter.stringFromDate(d)

// Los Angeles time zone
formatter.timeZone = NSTimeZone(name:"America/Los_Angeles")
formatter.stringFromDate(d)

// UTC, NOTE: UTC is not a time zone, but value is the same as GMT
formatter.timeZone = NSTimeZone(abbreviation:"UTC")
formatter.stringFromDate(d)

// GMT time
formatter.timeZone = NSTimeZone(abbreviation:"GMT")
formatter.stringFromDate(d)

// Get a list of time zone abbreviations and full strings
var timeZoneStrings = NSTimeZone.abbreviationDictionary()
var locales = NSLocale.availableLocaleIdentifiers()

// Format for Istanbul Time
formatter.timeZone = NSTimeZone(name:"Europe/Istanbul")
// Set the locale to get the proper format date
formatter.locale = NSLocale(localeIdentifier: "tr_TR")
formatter.stringFromDate(d)
