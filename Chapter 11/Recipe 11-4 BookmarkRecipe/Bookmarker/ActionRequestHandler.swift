//
//  ActionRequestHandler.swift
//  Bookmarker
//
//  Created by T Michael Rogers on 5/7/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit
import MobileCoreServices

class ActionRequestHandler: NSObject, NSExtensionRequestHandling {

    var extensionContext: NSExtensionContext?
    
    func beginRequestWithExtensionContext(context: NSExtensionContext) {
        // Do not call super in an Action extension with no user interface
        self.extensionContext = context
        
        var found = false
        
        let extensionItem = extensionContext?.inputItems.first as! NSExtensionItem
        let itemProvider = extensionItem.attachments?.first as! NSItemProvider
        
        let propertyList = String(kUTTypePropertyList)
        if itemProvider.hasItemConformingToTypeIdentifier(propertyList) {
            itemProvider.loadItemForTypeIdentifier(propertyList, options: nil, completionHandler: { (item, error) -> Void in
                let dictionary = item as! NSDictionary
                NSOperationQueue.mainQueue().addOperationWithBlock {
                    let results = dictionary[NSExtensionJavaScriptPreprocessingResultsKey] as! NSDictionary
                    let urlString = results["currentUrl"] as? String
                    println("URL selected: \(urlString)")
                    self.itemLoadCompletedWithPreprocessingResults(results as [NSObject : AnyObject])
                }
            })
        } else {
            println("error")
        }
    }
    
    func itemLoadCompletedWithPreprocessingResults(javaScriptPreprocessingResults: [NSObject: AnyObject]) {
        let url: AnyObject? = javaScriptPreprocessingResults["currentUrl"]
        if url == nil ||  url! as! String == "" {
            self.doneWithResults(["statusMessage": "Recipe Bookmark Failed"])
        } else {
            self.doneWithResults(["statusMessage": "Recipe Bookmarked"])
        }
    }
    
    func doneWithResults(resultsForJavaScriptFinalizeArg: [NSObject: AnyObject]?) {
        if let resultsForJavaScriptFinalize = resultsForJavaScriptFinalizeArg {
            var resultsDictionary = [NSExtensionJavaScriptFinalizeArgumentKey: resultsForJavaScriptFinalize]
            
            var resultsProvider = NSItemProvider(item: resultsDictionary, typeIdentifier: String(kUTTypePropertyList))
            
            var resultsItem = NSExtensionItem()
            resultsItem.attachments = [resultsProvider]
            
            self.extensionContext!.completeRequestReturningItems([resultsItem], completionHandler: nil)
        } else {
            self.extensionContext!.completeRequestReturningItems([], completionHandler: nil)
        }
        
        self.extensionContext = nil
    }

}
