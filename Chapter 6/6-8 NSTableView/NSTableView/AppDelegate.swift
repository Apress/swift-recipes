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
    
    var recipes = [
        Recipe(recipeName: "Apple Pie", preparationTime: 30),
        Recipe(recipeName: "Cherry Pie", preparationTime: 30),
        Recipe(recipeName: "Turkey", preparationTime: 180),
        Recipe(recipeName: "Stuffing", preparationTime: 15)
    ]

    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return recipes.count
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        var textField = tableView.makeViewWithIdentifier("TextCell", owner: self) as NSTextField?
        
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
}

