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

    var managedObjectContext: NSManagedObjectContext? = nil
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        
        var helper = CoreDataHelper(modelName: "RecipeBook", datastoreFileName: "RecipeBook.sqllite")
        var recipe = helper.newEntity("Recipe") as? Recipe
        
        if let r = recipe {
            r.name = "Apple Pie"
            r.serves = 8
            r.recipeDescription = "A summer tradition."
            
            helper.saveContext()
        }
        
    }
}

