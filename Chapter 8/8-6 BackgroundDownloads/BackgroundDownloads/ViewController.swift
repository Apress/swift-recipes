//
//  ViewController.swift
//  BackgroundDownloads
//
//  Created by T Michael Rogers on 2/21/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLSessionDownloadDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var configuration = NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier("FileDownload")
        
        configuration.sessionSendsLaunchEvents = true
        configuration.discretionary = true
        
        var session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil)

        var task = session.downloadTaskWithURL(NSURL(string:"http://www.brainloaf.com/introduction-to-ios.mp4")!)
        task.resume()
    }
    
    func URLSession(session: NSURLSession, didBecomeInvalidWithError error: NSError?) {
        println("Session is invalid: \(error?.description)")
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {

        println("Temporary file path: \(location)")
        var fileManager = NSFileManager()
        var err : NSError?
        var destination = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first?.stringByAppendingString("/introduction-to-ios.mp4") as String!
        
        if fileManager.moveItemAtURL(location, toURL: NSURL(fileURLWithPath: destination)!, error: &err) {
            println("File downloaded to \(destination)")
        } else {
            println("Failed to save \(err?.description)")
        }
    }

    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
            println("Wrote an additional \(bytesWritten) bytes (total \(totalBytesWritten) bytes) out \(totalBytesExpectedToWrite) total bytes.")
    }
        
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        if error == nil {
            println("Download completed")
        } else {
            println("Download failed with error \(error?.description)")
        }
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        if let complete = appDelegate.completionHandler {
            complete()
            appDelegate.completionHandler = nil
        }
    }
}

