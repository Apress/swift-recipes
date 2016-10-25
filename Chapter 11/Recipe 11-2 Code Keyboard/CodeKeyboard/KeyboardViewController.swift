//
//  KeyboardViewController.swift
//  CodeKeyboard
//
//  Created by T Michael Rogers on 5/3/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!

    @IBAction func newLine (sender: AnyObject) {
        (textDocumentProxy as! UITextDocumentProxy).insertText("\n")
    }

    @IBAction func backspace(sender: AnyObject) {
        (textDocumentProxy as! UITextDocumentProxy).deleteBackward()
    }
    @IBAction func keyUp(sender: AnyObject) {
        var proxy = textDocumentProxy as! UITextDocumentProxy

        var button = sender as? UIButton

        if let input = button?.titleLabel?.text as String? {
            if input == "Space"
            {
                proxy.insertText(" ")
                return
            }
            proxy.insertText(input)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var xib = NSBundle.mainBundle().loadNibNamed("CodeKeyboard", owner: self, options: nil)
        
        var keyboardView = xib[0] as! UIView
        keyboardView.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addSubview(keyboardView)
        
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
    }
}
