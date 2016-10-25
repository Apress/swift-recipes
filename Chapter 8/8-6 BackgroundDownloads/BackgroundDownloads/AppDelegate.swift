//
//  AppDelegate.swift
//  BackgroundDownloads
//
//  Created by T Michael Rogers on 2/21/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var completionHandler: (() -> Void)?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: () -> Void) {
        self.completionHandler = completionHandler
        
    }
}

