//
//  MasterViewController.swift
//  UITableView
//
//  Created by Mike Rogers on 2/1/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell?
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        cell?.textLabel?.text = states[indexPath.row]
        cell?.detailTextLabel?.text = "Subtitle"
        
        return cell!
    }
    
    var states = ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","District Of Columbia","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
}

