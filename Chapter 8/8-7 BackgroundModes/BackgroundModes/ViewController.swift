//
//  ViewController.swift
//  BackgroundModes
//
//  Created by T Michael Rogers on 2/24/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//
//
//  FindingLocationViewController.swift
//  SuperMagicPartyButton
//
//  Created by T Michael Rogers on 2/16/15.
//  Copyright (c) 2015 GigMasters. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager : CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        } else {
            println("Please allow access to your location in your settings.")
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var lastLocation = locations.last as? CLLocation
        
        if let location = lastLocation {
            println("Location Updated to: \(location.coordinate.latitude) Lat.,\(location.coordinate.longitude) Long.")
        }
    }
}

