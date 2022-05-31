//
//  LocationManager.swift
//  SwiftyWeather
//
//  Created by Nuno Mota on 31/05/2022.
//

import Foundation
import CoreLocation
import Combine


final class LocationManager: NSObject, LocationService {
    
    var location = PassthroughSubject<CLLocationCoordinate2D, Error>()
    let manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else { return }
        location.send(CLLocationCoordinate2D(latitude: lastLocation.coordinate.latitude, longitude: lastLocation.coordinate.longitude))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location: \(error)")
        location.send(completion: .failure(error))
    }
    
}
