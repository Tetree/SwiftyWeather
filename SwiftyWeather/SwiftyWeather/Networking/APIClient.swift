//
//  APIClient.swift
//  SwiftyWeather
//
//  Created by Nuno Mota on 31/05/2022.
//

import Foundation
import Combine
import CoreLocation

final class APIClient : APIService {

    // MARK: - API Service
    func weather(latitude: Double, longitude: Double) -> AnyPublisher<WeatherResponse, APIError> {
        request(.location(CLLocationCoordinate2D(latitude: latitude, longitude: longitude)))
    }
    
    private func request<T: Decodable>(_ endpoint: APIEndpoint) -> AnyPublisher<T, APIError> {
        let request = endpoint.request
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { (data: Data, response: URLResponse) -> T in
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                    throw APIError.failedRequest
                }
                
                guard (200..<300) ~= statusCode else {
                    throw APIError.failedRequest
                }
                
                do {
                    return try JSONDecoder().decode(T.self, from: data)
                }catch {
                    print("Unable to Decode Response \(error)")
                    throw APIError.invalidResponse
                }
            }
            .mapError { error -> APIError in
                switch error {
                case let apiError as APIError:
                    return apiError
                case URLError.notConnectedToInternet:
                    return APIError.unreachable
                default:
                    return APIError.failedRequest
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
