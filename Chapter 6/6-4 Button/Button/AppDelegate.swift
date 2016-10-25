//
//  AppDelegate.swift
//  Button
//
//  Created by T Michael Rogers on 3/8/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        var button = NSButton(frame: CGRect(x: 100, y: 100, width: 80, height: 30))
        
        button.setButtonType(NSButtonType.MomentaryLightButton)
        button.title = "Click Me!"
        button.target = self
        button.action = Selector("buttonClicked:")
        
        self.window.contentView.addSubview(button)
    }
    
    func buttonClicked( sender : NSButton ) {
        println("Button clicked")
    }
}

