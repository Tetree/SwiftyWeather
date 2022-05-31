//
//  LocationService.swift
//  SwiftyWeather
//
//  Created by Nuno Mota on 31/05/2022.
//

import Foundation
import CoreLocation
import Combine

protocol LocationService {
    var location: PassthroughSubject<CLLocationCoordinate2D, Error> { get }
    func requestLocation()
}
