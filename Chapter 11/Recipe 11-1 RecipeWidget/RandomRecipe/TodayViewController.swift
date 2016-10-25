//
//  TodayViewController.swift
//  RandomRecipe
//
//  Created by T Michael Rogers on 5/4/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var recipeName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var service = RecipeService()
        recipeName.text = service.randomRecipe()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
    func widgetMarginInsetsForProposedMarginInsets
        (defaultMarginInsets: UIEdgeInsets) -> (UIEdgeInsets) {
            return UIEdgeInsetsZero
    }
}
