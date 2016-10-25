//
//  AppDelegate.swift
//  NSTextField
//
//  Created by T Michael Rogers on 3/14/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSTextFieldDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet var textField : NSTextField!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        var rect = CGRect(x: 10, y: window.frame.height - 50, width: 300.0, height: 20.0)
        textField = NSTextField(frame: rect)
        textField.delegate = self
        self.window.contentView.addSubview(textField)
    }

    override func controlTextDidChange(obj: NSNotification) {
            println("Text changed: \(textField.stringValue)")
    }
}

