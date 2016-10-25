//
//  AppDelegate.swift
//  RecipeBook
//
//  Created by T Michael Rogers on 5/7/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let navigationController = self.window!.rootViewController as! UINavigationController
        let controller = navigationController.topViewController as! MasterViewController
        
        return true
    }
}

