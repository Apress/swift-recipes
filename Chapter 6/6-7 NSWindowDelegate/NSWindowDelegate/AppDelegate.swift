//
//  AppDelegate.swift
//  NSWindowDelegate
//
//  Created by T Michael Rogers on 3/18/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {

    @IBOutlet weak var window: NSWindow!
    var imageView : NSImageView!
    var windowBarHeight : CGFloat = 0.0
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let rect = CGRect(x: 0, y: 0,
            width: window.frame.width, height: window.frame.height)
        
        let contentRect = window.contentRectForFrameRect(rect)
        windowBarHeight = window.frame.height - contentRect.height
        
        imageView = NSImageView(frame: contentRect)
        imageView.imageScaling = .ImageScaleProportionallyUpOrDown
        imageView.image = NSImage(named: "ship.jpg")
        
        window.contentView.addSubview(imageView)
        window.delegate = self
    }
    
    func windowWillResize(sender: NSWindow, toSize frameSize: NSSize) -> NSSize {
        imageView.frame = NSRect(
            x: imageView.frame.origin.x,
            y: imageView.frame.origin.y,
            width: frameSize.width,
            height: frameSize.height - windowBarHeight)
        
        return frameSize
    }
}

