//
//  LocationManager.swift
//  TabBarControllerExample
//
//  Created by DongMin Hwang on 2023/02/03.
//

import Foundation
import CoreLocation

protocol LocationManagerDelegate {
    func needPermission()
    func updateCallback()
    func hasPermission()
}

class LocationManager : NSObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager!
    var lastLocation: CLLocation?
    var isUpdating: Bool?
    var delegate: LocationManagerDelegate?
    
    static let shared:LocationManager = {
        let instance = LocationManager()
        return instance
    }()
    
    override init() {
        super.init()
        
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        lastLocation = location
        if let delegate = delegate {
            delegate.updateCallback()
        }
        //황동민_주석_2022.12.22
//        print("kjk location \(manager) in \(location)")
    }
    
    func startUpdatingLocation(){
        print("kjk Starting Location Updates")
        checkPermission()
        isUpdating = true
    }
    
    func checkPermission() {
        let status: CLAuthorizationStatus = CLLocationManager.authorizationStatus()
        switch status {
        case .notDetermined:
            locationManager?.requestAlwaysAuthorization()
            locationManager?.requestWhenInUseAuthorization()
        case .restricted, .denied:
            if let delegate = delegate {
                delegate.needPermission()
            }
        case .authorizedAlways, .authorizedWhenInUse :
            locationManager?.startUpdatingLocation()
            if let delegate = delegate {
                delegate.hasPermission()
            }
        @unknown default:
            if let delegate = delegate {
                delegate.needPermission()
            }
            break
        }
    }
}
