//
//  MasterViewController.swift
//  RecipeBook
//
//  Created by T Michael Rogers on 5/2/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var helper : CoreDataHelper!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        
        helper = CoreDataHelper(modelName: "RecipeBook", datastoreFileName: "RecipeBook.sqllite")
        var recipe = helper.newEntity("Recipe") as? Recipe

        if let r = recipe {
            r.name = "Apple Pie"
            r.serves = 8
            r.recipeDescription = "A summer tradition."
            
            helper.saveContext()
        }
        
        let fetchRequest = NSFetchRequest()

        let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: helper.managedObjectContext!)
        fetchRequest.entity = entity

        var error : NSError?
        var results = helper.managedObjectContext?.executeFetchRequest(fetchRequest, error: &error) as? [Recipe]

        if let recipes = results {
            for r in recipes {
                println("Name: \(r.name)")
            }
        }
    }
    
    // MARK: - Fetched results controller
    var _fetchedResultsController: NSFetchedResultsController? = nil

    var fetchedResultsController: NSFetchedResultsController {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest = NSFetchRequest()

        let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: helper.managedObjectContext!)
        fetchRequest.entity = entity
        fetchRequest.fetchBatchSize = 20
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        let sortDescriptors = [sortDescriptor]
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let statusPredicate = NSPredicate(format: "serves < %d", 2)
        fetchRequest.predicate = statusPredicate
        
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: helper.managedObjectContext!, sectionNameKeyPath: nil, cacheName: nil)
        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        
        var error: NSError? = nil
        if !_fetchedResultsController!.performFetch(&error) {
            println("Unresolved error \(error), \(error?.userInfo)")
            abort()
        }
        
        return _fetchedResultsController!
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.fetchedResultsController.sections?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = self.fetchedResultsController.sections![section] as! NSFetchedResultsSectionInfo
        return sectionInfo.numberOfObjects
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        let recipe = self.fetchedResultsController.objectAtIndexPath(indexPath) as! Recipe
        cell.textLabel!.text = recipe.name
        
        return cell
    }
    
    // MARK: Enable Editing
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let context = self.fetchedResultsController.managedObjectContext
            context.deleteObject(self.fetchedResultsController.objectAtIndexPath(indexPath) as! NSManagedObject)
            
            helper.saveContext()
        }
    }

    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        // In the simplest, most efficient, case, reload the table view.
        self.tableView.reloadData()
    }
}

