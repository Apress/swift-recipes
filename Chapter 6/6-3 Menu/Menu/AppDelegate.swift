//
//  AppDelegate.swift
//  Menu
//
//  Created by T Michael Rogers on 3/8/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        var myMenuBarItem = NSMenuItem(title: "My Menu",
            action: nil, keyEquivalent: "")
        
        var myMenu = NSMenu(title: "My Menu")
        
        myMenuBarItem.submenu = myMenu
        
        var mi = NSMenuItem(title: "Pick me!",
            action: Selector("menuItemSelected:"), keyEquivalent: "k")
        var mi2 = NSMenuItem(title: "Then Pick Me!",
            action: Selector("menuItemSelected:"), keyEquivalent: "")
        var mi3 = NSMenuItem(title: "You can't pick me",
            action: Selector("dontPickMe:"), keyEquivalent: "")
        
        myMenu.addItem(mi)
        myMenu.addItem(mi2)
        myMenu.addItem(mi3)
        
        NSApp.mainMenu??.addItem(myMenuBarItem)
    }
    
    func menuItemSelected( sender : NSMenuItem ) {
        println("Menu item selected: \(sender.title)")
    }
    
    func dontPickMe( sender : NSMenuItem ) {
        println("This should not be called")
    }
    
    override func validateMenuItem(menuItem: NSMenuItem) -> Bool {
        if menuItem.action == Selector("dontPickMe:")
        {
            return false
        }
        return true
    }
}

