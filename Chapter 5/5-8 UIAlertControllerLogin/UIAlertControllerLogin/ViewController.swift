//
//  ViewController.swift
//  UIAlertControllerLogin
//
//  Created by Mike Rogers on 1/31/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var loginField : UITextField!
    var passwordField : UITextField!
    
    override func viewDidAppear(animated: Bool) {
        let loginAlert = UIAlertController(title: "Login", message: "Please enter your credentials", preferredStyle: .Alert)
        
        loginAlert.addTextFieldWithConfigurationHandler() { (textField) -> Void in
            textField.placeholder = "Username"
            self.loginField = textField
        }
        loginAlert.addTextFieldWithConfigurationHandler() { (textField) -> Void in
            textField.placeholder = "Password"
            textField.secureTextEntry = true
            self.passwordField = textField
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        loginAlert.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Login", style: .Default) { (action) in
            let username = self.loginField.text
            let password = self.passwordField.text
            NSLog("Username: \(username) Password: \(password)")
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        loginAlert.addAction(OKAction)
        self.presentViewController(loginAlert, animated: true, completion: nil)
    }
}

