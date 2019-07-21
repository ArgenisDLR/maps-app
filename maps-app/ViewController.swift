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
  
  // adding the annotations
  fileprivate func addAnnotationToMap() {
    
    let annotation = MKPointAnnotation()
    
//    annotation.coordinate = CLLocationCoordinate2D(latitude: <#T##CLLocationDegrees#>, longitude: <#T##CLLocationDegrees#>)
    
    annotation.title = "Argenis is out here!"
    annotation.subtitle = "Learning to code better!"
    annotation.coordinate = mapView.userLocation.coordinate
    mapView.addAnnotation(annotation)
  }
  
  // segmented control option at bottom of view controller
  @objc fileprivate func switchType() {
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
  
  //
  fileprivate func setupMapSnapshot(annotation: MKAnnotationView)
  
  // update the user location
  func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
    mapView.setRegion(region, animated: true)
    addAnnotationToMap()
  }
  
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    if annotation is MKUserLocation { return nil }
    
//    var marker = mapView.dequeueReusableAnnotationView(withIdentifier: "annotation") as? MKMarkerAnnotationView
    
    let marker = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "annotation")
    marker.glyphText = "coffee"
    marker.canShowCallout = true
    marker.leftCalloutAccessoryView = UIImageView(image: #imageLiteral(resourceName: "pin"))
    marker.rightCalloutAccessoryView = UIImageView(image: #imageLiteral(resourceName: "chevron"))
    return marker
  }
  
}
