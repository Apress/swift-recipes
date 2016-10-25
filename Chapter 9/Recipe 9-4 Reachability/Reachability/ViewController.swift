//
//  ViewController.swift
//  Reachability
//
//  Created by T Michael Rogers on 4/26/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var reach : Reachability!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reach = Reachability.reachabilityForInternetConnection()
        checkForReachability()
        
        NSNotificationCenter.defaultCenter()
            .addObserver(self, selector:"checkForReachabilityHandler:",
                name: kReachabilityChangedNotification, object: nil)
        
        reach.startNotifier()
    }
    
    func checkForReachabilityHandler( notification : NSNotification )
    {
        checkForReachability()
    }
    
    func checkForReachability()
    {
        switch reach.currentReachabilityStatus().value
        {
        case ReachableViaWiFi.value:
            println("Connected to WiFi")
        case ReachableViaWWAN.value:
            println("Connected via Wireless Data")
        case NotReachable.value:
            println("No Connection")
        default:
            println("No Connection")
        }
    }
}

