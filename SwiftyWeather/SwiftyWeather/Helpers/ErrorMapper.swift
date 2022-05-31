//
//  ErrorMapper.swift
//  SwiftyWeather
//
//  Created by Nuno Mota on 31/05/2022.
//

import Foundation

struct ErrorMapper {
    
    // MARK: - Types

    enum Context {
        case location
    }
    
    let error: APIError
    let context: Context
    
    // MARK: -
    var message: String {
        switch error {
        case .unreachable:
            return "You need to have a network connection."
        case .unknown,
             .failedRequest,
             .invalidResponse:
            switch context {
            case .location:
                return "The weather for your region could not be fetched"
            }
        }
    }
}
