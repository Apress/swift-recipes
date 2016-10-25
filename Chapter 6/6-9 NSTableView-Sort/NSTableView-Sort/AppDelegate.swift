//
//  AppDelegate.swift
//  NSTableView
//
//  Created by T Michael Rogers on 3/22/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSTableViewDataSource, NSTableViewDelegate {
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var tableView : NSTableView!
    
    var recipes = [
        Recipe(recipeName: "Apple Pie", preparationTime: 30),
        Recipe(recipeName: "Cherry Pie", preparationTime: 30),
        Recipe(recipeName: "Turkey", preparationTime: 180),
        Recipe(recipeName: "Stuffing", preparationTime: 15)
    ]
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        var recipeNameColumn = tableView.tableColumnWithIdentifier("RecipeName")
        var preparationTimeColumn = tableView.tableColumnWithIdentifier("PreparationTime")
        
        recipeNameColumn?.sortDescriptorPrototype = NSSortDescriptor(key: "recipeName",
            ascending: true, selector: Selector("compare:"))
        
        preparationTimeColumn?.sortDescriptorPrototype =
            NSSortDescriptor(key: "preparationTime", ascending: true) {
            (a,b) -> NSComparisonResult in
            
            if a.integerValue > b.integerValue {
                return NSComparisonResult.OrderedDescending
            }
            if a.integerValue < b.integerValue {
                return NSComparisonResult.OrderedAscending
            }
            return NSComparisonResult.OrderedSame
        }
    }

    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return recipes.count
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        var textField = tableView.makeViewWithIdentifier("TextCell", owner: self) as! NSTextField?
        
        if textField == nil {
            textField = NSTextField(frame: CGRect(x: 0,y: 0,width: window.frame.width/2, height: 20))
            textField?.identifier = "TextCell"
            textField?.editable = false
            textField?.bordered = false
            textField?.bezeled = false
            textField?.drawsBackground = false
        }
        
        if let column = tableColumn {
            
            switch column.identifier {
                case "RecipeName":
                    textField?.stringValue = recipes[row].recipeName
                case "PreparationTime":
                    textField?.stringValue = "\(recipes[row].preparationTime)"
                default:
                    break
            }
        }
        return textField
    }
    
    func tableView(tableView: NSTableView, sortDescriptorsDidChange oldDescriptors: [AnyObject]) {
        var array = NSMutableArray(array: recipes)
        
        array.sortUsingDescriptors(tableView.sortDescriptors)
        
        recipes = array as AnyObject as! [Recipe]
        tableView.reloadData()
    }
}

