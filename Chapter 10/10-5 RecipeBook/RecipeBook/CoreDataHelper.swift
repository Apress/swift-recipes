//
//  CoreDataHelper.swift
//  RecipeBook
//
//  Created by T Michael Rogers on 5/2/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import Foundation
import CoreData

public class CoreDataHelper : NSFetchedResultsControllerDelegate {
    
    var modelName : String
    var datastoreFileName : String
    
    init( modelName : String, datastoreFileName : String)
    {
        self.modelName = modelName
        self.datastoreFileName = datastoreFileName
    }
    
    // MARK: Core Data
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = NSBundle.mainBundle().URLForResource(self.modelName, withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
        }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        // Create the coordinator and store
        var coordinator: NSPersistentStoreCoordinator? =
            NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let documentsDirectory : NSURL =
            NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory,
                inDomains: .UserDomainMask).last as! NSURL
        
        let url = documentsDirectory.URLByAppendingPathComponent(self.datastoreFileName)
        println("DEBUG: path to data file \(url)")
        var error: NSError? = nil
        let options = [NSMigratePersistentStoresAutomaticallyOption: true,
            NSInferMappingModelAutomaticallyOption: true]
        if coordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil,
            URL: url, options: options, error: &error) == nil {
                
                coordinator = nil
                // Report any error we got.
                var dict = [String: AnyObject]()
                dict[NSLocalizedDescriptionKey]
                    = "Failed to initialize the application's saved data"
                dict[NSLocalizedFailureReasonErrorKey]
                    = "There was an error creating or loading the application's saved data."
                dict[NSUnderlyingErrorKey] = error
                error = NSError(domain: "com.apress.recipebook", code: 9999, userInfo: dict)
                // Replace this with code to handle the error appropriately.
                NSLog("Unresolved error \(error), \(error!.userInfo)")
                abort()
        }
        
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext? = {
        let coordinator = self.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    func newEntity( named : String ) -> NSManagedObject? {
        if managedObjectContext == nil {
            return nil
        }
        var newManagedObject = NSEntityDescription.insertNewObjectForEntityForName(named, inManagedObjectContext: managedObjectContext!) as? NSManagedObject
        
        return newManagedObject
    }

    func saveContext() {
        let context = self.managedObjectContext!
        var error: NSError? = nil
        if !context.save(&error) {
            // You must handle the error properly in a graceful way.
            // abort() may be used for development, but should not be used in a
            // production quality appliction
            println("Unresolved error \(error), \(error?.userInfo)")
            abort()
        }
    }
}