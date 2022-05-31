//
//  APIService.swift
//  SwiftyWeather
//
//  Created by Nuno Mota on 31/05/2022.
//

import Foundation
import Combine

protocol APIService {
    
    func weather(latitude: Double, longitude: Double) -> AnyPublisher<WeatherResponse, APIError>
}
