//
//  ViewController.swift
//  maps-app
//
//  Created by argenis delarosa on 7/17/19.
//  Copyright © 2019 argenis delarosa. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
  
  @IBOutlet weak var mapView: MKMapView!
  
  fileprivate let locationManager = CLLocationManager()

  override func viewDidLoad() {
    super.viewDidLoad()

    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.distanceFilter = kCLDistanceFilterNone
    locationManager.startUpdatingLocation()
    
    mapView.showsUserLocation = true
    mapView.delegate = self
  }


}

extension ViewController: CLLocationManagerDelegate {
  
  
}

extension ViewController: MKMapViewDelegate {
  
  
}
