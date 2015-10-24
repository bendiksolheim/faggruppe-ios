//
//  ViewController.swift
//  Faggruppe
//
//  Created by Bendik Solheim on 24/10/15.
//  Copyright © 2015 Bendik. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    var mapView : MKMapView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = MKMapView(frame: view.bounds)
        view.addSubview(mapView!)
        
        let centerButton = UIButton(type: UIButtonType.InfoDark)
        centerButton.addTarget(self, action: "centerHome:", forControlEvents: UIControlEvents.TouchUpInside)
        centerButton.center = CGPointMake(CGRectGetMaxX(view.frame) - 20.0, CGRectGetMaxY(view.frame) - 20.0)
        view.addSubview(centerButton)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func centerHome(sender: UIButton) {
        let location = CLLocation(latitude: 63.3985591, longitude: 10.3940111)
        centerMapOn(location)
    }
    
    let regionRadius : CLLocationDistance = 1000
    
    func centerMapOn(location: CLLocation) {
        let region = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        print(region)
        mapView?.setRegion(region, animated: true)
    }
}

