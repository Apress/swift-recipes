//
//  AppDelegate.swift
//  BackgroundTasks
//
//  Created by T Michael Rogers on 2/16/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
func applicationDidEnterBackground(application: UIApplication) {
    var taskToken : UIBackgroundTaskIdentifier = UIBackgroundTaskInvalid
    
    taskToken = application.beginBackgroundTaskWithExpirationHandler { () -> Void in
        application.endBackgroundTask(taskToken)
        taskToken = UIBackgroundTaskInvalid
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
    println("Perform a long running task such as saving data")
    application.endBackgroundTask(taskToken)
    taskToken = UIBackgroundTaskInvalid
    }
}

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

