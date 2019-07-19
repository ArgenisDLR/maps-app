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
  
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  
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
    
    segmentedControl.addTarget(self, action: #selector(switchType), for: .valueChanged)
  }
  
  @objc func switchType() {
    switch segmentedControl.selectedSegmentIndex {
    case 0:
      mapView.mapType = .standard
    case 1:
      mapView.mapType = .satellite
    case 2:
      mapView.mapType = .hybrid
    default:
      return
    }
  }


}

extension ViewController: CLLocationManagerDelegate {
  
  
}

extension ViewController: MKMapViewDelegate {
  
  func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    <#code#>
  }
  
}
