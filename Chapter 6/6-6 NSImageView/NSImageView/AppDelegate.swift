//
//  AppDelegate.swift
//  NSImageView
//
//  Created by T Michael Rogers on 3/15/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    var imageView : NSImageView!
    var windowBarHeight : CGFloat = 0.0
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let image = NSImage(named: "ship.jpg")
        let rect = CGRect(x: 10, y: 10,
            width: 300, height: 200)
        
        imageView = NSImageView(frame: rect)
        imageView.image = image
        
        window.contentView.addSubview(imageView)
    }
}

