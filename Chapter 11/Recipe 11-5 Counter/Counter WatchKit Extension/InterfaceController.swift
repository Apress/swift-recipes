//
//  InterfaceController.swift
//  Counter WatchKit Extension
//
//  Created by T Michael Rogers on 5/12/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    var count = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        counter.setText("\(count)")
        
    }

    @IBOutlet weak var counter: WKInterfaceLabel!
    @IBAction func increment() {
        counter.setText("\(++count)")
    }
}
