//
//  APIEndpoint.swift
//  SwiftyWeather
//
//  Created by Nuno Mota on 31/05/2022.
//

import Foundation
import CoreLocation

enum APIEndpoint {
    
    //MARK: - cases
    case location(CLLocationCoordinate2D)
    
    // MARK: - Properties
    private var url: URL {
        URL(string: path)!
    }
    
    private var path: String {
        var path = ""
        switch self {
        case .location(let coordinate):
            path = Environment.baseUrlString
                .replacingOccurrences(of: "\(Environment.latPath)",
                                      with: "\(coordinate.latitude)")
                .replacingOccurrences(of: "\(Environment.lonPath)",
                                      with: "\(coordinate.longitude)")
        }
        
        return path.replacingOccurrences(of: "\(Environment.apiKeyPath)",
                                  with: "\(Environment.apiToken)")
    }
    
    private var httpMethod: HTTPMethod {
        switch self {
        case .location(_):
            return .get
        }
    }
    
    var request: URLRequest {
        switch self {
        case .location( _):
            var request = URLRequest(url: url)
            request.httpMethod = httpMethod.rawValue
            
            return request
        }
    }
    
}
