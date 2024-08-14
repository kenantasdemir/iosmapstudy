//
//  ViewController.swift
//  iosmapstudy
//
//  Created by kenan on 12.08.2024.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {


    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var latLabel: UILabel!
    
    @IBOutlet weak var longLabel: UILabel!
    
    @IBOutlet weak var speedLabel: UILabel!
    
    var locationManager:CLLocationManager = CLLocationManager()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }


}

extension ViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let sonKonum:CLLocation = locations[locations.count-1]
        
        latLabel.text = "Enlem : \(sonKonum.coordinate.latitude)"
        longLabel.text = "Boylam : \(sonKonum.coordinate.longitude)"
        speedLabel.text = "Hız : \(sonKonum.speed)"
        
        let konum = CLLocationCoordinate2D(latitude: sonKonum.coordinate.latitude, longitude: sonKonum.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let bolge = MKCoordinateRegion(center: konum, span: span)
        
        mapView.setRegion(bolge, animated: true)
        
        mapView.showsUserLocation = true
        
        
    }
}

