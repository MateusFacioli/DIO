//
//  MapViewController.swift
//  DIO-MAPS-TASKS
//
//  Created by Mateus Rodrigues on 21/05/23.
//

import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //pedindo autorizaçao para user
       
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        print("TEXUGO \(locationManager.authorizationStatus.rawValue.description)")

        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        mapView.showsUserLocation = true
        //(latitude: -22.825471517411042, longitude: -47.02255407156297)
        locationManager.startUpdatingLocation()
    }
}


extension MapViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        mapView.centerCoordinate = location!.coordinate
        let region = mapView.regionThatFits(MKCoordinateRegion(center: location!.coordinate, latitudinalMeters: 600.0, longitudinalMeters: 600.0))
        mapView.setRegion(region, animated: false)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
       print(status)
    }
}
