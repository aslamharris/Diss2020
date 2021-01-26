//
//  GoogleMapsViewController.swift
//  Diss2020
//
//  Created by Harris Aslam on 28/03/2020.
//  Copyright © 2020 Harris Aslam. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps
import GooglePlaces
import CoreLocation

class GoogleMapsViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        
        if CLLocationManager.locationServicesEnabled() == true {
            
            if CLLocationManager.authorizationStatus() == .restricted ||
                CLLocationManager.authorizationStatus() == .denied ||
                CLLocationManager.authorizationStatus() == .notDetermined {
            
                locationManager.requestWhenInUseAuthorization()
            }
            
            locationManager.desiredAccuracy = 1.0
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
            
        } else {
            print("Please turn on location services or GPS")
            }
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 55.957990, longitude: -3.184670)
        annotation.title = "Tribe Yoga Leith Walk"
        mapView.addAnnotation(annotation)
        
        let annotation2 = MKPointAnnotation()
               annotation2.coordinate = CLLocationCoordinate2D(latitude: 55.944019, longitude: -3.192406)
               annotation2.title = "Tribe Yoga Quartermile"
               mapView.addAnnotation(annotation2)
        
        let annotation3 = MKPointAnnotation()
               annotation3.coordinate = CLLocationCoordinate2D(latitude: 55.955100, longitude: -3.199530)
               annotation3.title = "Tribe Yoga New Town"
               mapView.addAnnotation(annotation3)
        
        let annotation4 = MKPointAnnotation()
        annotation4.coordinate = CLLocationCoordinate2D(latitude: 55.958400, longitude: -3.212710)
        annotation4.title = "Mindfullybeing Scotland"
        mapView.addAnnotation(annotation4)
        
        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
      {
          let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 55.953251, longitude: -3.188267), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    //      self.mapView.region = region
          self.mapView.setRegion(region, animated: true)
      }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Unable to access your current location")
        }
  }
