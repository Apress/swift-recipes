//
//  ShareViewController.swift
//  ShareRecipe
//
//  Created by T Michael Rogers on 5/10/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {

    var userRating : SLComposeSheetConfigurationItem!
    let star : Character = "\u{2605}"

    override func isContentValid() -> Bool {
        var messageLength =
            count(self.contentText)
        
        var charactersRemaining = 100 - messageLength;
        self.charactersRemaining = charactersRemaining;
        
        if charactersRemaining >= 0 {
            return true;
        }

        return false;
    }

    override func didSelectPost() {
        println("Message: \(self.contentText)")
        println("Rating: \(count(userRating.value)) Stars")
        self.extensionContext!.completeRequestReturningItems([], completionHandler: nil)
    }

    override func configurationItems() -> [AnyObject]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        userRating = SLComposeSheetConfigurationItem()
        
        userRating.title = "Rating"
        userRating.value = ""
        
        userRating.tapHandler = {
            SLComposeSheetConfigurationItemTapHandler in
            
            var starsSelection = UIViewController()
            //starsSelection.view.setTranslatesAutoresizingMaskIntoConstraints(false)
            var s1 = self.createStarButton(1)
            var s2 = self.createStarButton(2)
            var s3 = self.createStarButton(3)
            var s4 = self.createStarButton(4)
            var s5 = self.createStarButton(5)
            var views = ["s1":s1,"s2":s2,"s3":s3,"s4":s4,"s5":s5]
            
            starsSelection.view.addSubview(s1)
            starsSelection.view.addSubview(s2)
            starsSelection.view.addSubview(s3)
            starsSelection.view.addSubview(s4)
            starsSelection.view.addSubview(s5)
            
            starsSelection.view.addConstraints(
                NSLayoutConstraint.constraintsWithVisualFormat(
                    "H:|-[s1(s2)]-[s2(s3)]-[s3(s4)]-[s4(s5)]-[s5]-|",
                    options: NSLayoutFormatOptions(0), metrics: nil, views: views))
            starsSelection.view.addConstraints(
                NSLayoutConstraint.constraintsWithVisualFormat("V:|-[s1(30)]",
                    options: NSLayoutFormatOptions(0), metrics: nil, views: views))
            starsSelection.view.addConstraints(
                NSLayoutConstraint.constraintsWithVisualFormat("V:|-[s2(30)]",
                    options: NSLayoutFormatOptions(0), metrics: nil, views: views))
            starsSelection.view.addConstraints(
                NSLayoutConstraint.constraintsWithVisualFormat("V:|-[s3(30)]",
                    options: NSLayoutFormatOptions(0), metrics: nil, views: views))
            starsSelection.view.addConstraints(
                NSLayoutConstraint.constraintsWithVisualFormat("V:|-[s4(30)]",
                    options: NSLayoutFormatOptions(0), metrics: nil, views: views))
            starsSelection.view.addConstraints(
                NSLayoutConstraint.constraintsWithVisualFormat("V:|-[s5(30)]",
                    options: NSLayoutFormatOptions(0), metrics: nil, views: views))
            self.pushConfigurationViewController(starsSelection)
            
        }
        
        return [userRating]
    }

    func createStarButton(value : Int ) -> UIButton {
        var button = UIButton()
        button.setTitle("\(star)", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        button.tag = value
        return button
    }
    
    func buttonTapped(sender : AnyObject?) {
        println("#\(sender!.tag) tapped")
        var rating : Int = sender!.tag as Int

        var stars = ""
        for i in 1...rating {
           stars += "\(star)"
        }
        userRating.value=stars
        self.popConfigurationViewController()
    }
}
