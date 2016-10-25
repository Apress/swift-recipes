//
//  AppDelegate.swift
//  AddView
//
//  Created by T Michael Rogers on 3/8/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        var view = NSView(frame: CGRect(x: 10, y: 10, width: 300, height: 300))
        
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.blueColor().CGColor
        
        self.window.contentView.addSubview(view)
    }
}

