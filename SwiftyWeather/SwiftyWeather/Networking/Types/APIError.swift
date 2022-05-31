//
//  APIError.swift
//  SwiftyWeather
//
//  Created by Nuno Mota on 31/05/2022.
//

import Foundation

enum APIError: Error {
    // MARK: - Cases
    case unknown
    case failedRequest
    case invalidResponse
    case unreachable
}
