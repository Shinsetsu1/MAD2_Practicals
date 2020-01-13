//
//  MapViewController.swift
//  Telegramme
//
//  Created by MAD2_P02 on 6/1/20.
//  Copyright © 2020 MAD2_P02. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {
    
    let regionRadius: CLLocationDistance = 250
    
    let locationDelegate = LocationDelegate()
    var latestLocation: CLLocation? = nil
    
    let locationManager: CLLocationManager = {
        $0.requestWhenInUseAuthorization()
        $0.desiredAccuracy = kCLLocationAccuracyBest
        $0.startUpdatingLocation()
        $0.startUpdatingHeading()
        return $0
    }(CLLocationManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = locationDelegate
        
        locationDelegate.locationCallback = { location in
            self.latestLocation = location
            let lat = String(format: "Lat: %3.8f", location.coordinate.latitude)
            let long = String(format: "Long: %3.8f", location.coordinate.longitude)
            print("My current location \(lat), \(long)")
            
            self.centerMapOnLocation(location: location)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.coordinate
            annotation.title = "Me"
            annotation.subtitle = "Current location"
            self.map.addAnnotation(annotation)
                  
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString("535 Clementi Road Singapore 599489",completionHandler: {p,e in

                let lat = String(
                    format: "Lat: %3.12f", p![0].location!.coordinate.latitude)
                let long = String(
                    format: "Long: %3.12f", p![0].location!.coordinate.longitude)
                
                let annotation2 = MKPointAnnotation()
                annotation2.coordinate = p![0].location!.coordinate
                annotation2.title = "Ngee Ann Polytechnic"
                annotation2.subtitle = "School of ICT"
                self.map.addAnnotation(annotation2)

                print("\(lat), \(long)")
            })
        }
    }
    @IBOutlet weak var map: MKMapView!
    
    func centerMapOnLocation(location: CLLocation)
    {
        let coordinateRegion = MKCoordinateRegion (
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        
        map.setRegion(coordinateRegion, animated: true)
    }
}
