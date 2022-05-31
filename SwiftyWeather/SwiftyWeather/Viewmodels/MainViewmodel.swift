//
//  MainViewmodel.swift
//  SwiftyWeather
//
//  Created by Nuno Mota on 31/05/2022.
//

import Foundation
import Combine

final class MainViewmodel: ObservableObject {
    
    @Published private(set) var hasLocation = false
    @Published private(set) var weather:WeatherResponse?
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String?
    
    private var subscriptions = Set<AnyCancellable>()
    
    private let apiService: APIService
    private let locationService: LocationService
    
    init(apiService: APIService, locationService: LocationService) {
        self.apiService = apiService
        self.locationService = locationService
    }
    
    func requestLocation() {
        locationService.requestLocation()
    }
    
    private func addSubscriptions() {
        
        locationService.location.sink { [weak self] result in
            switch result {
            case .failure(let error):
                self?.isLoading = false
                self?.errorMessage = "Failed to retrieve your location"
                break
            case .finished:
                break
            }
        } receiveValue: { [weak self] location in
            self?.hasLocation = true
            self?.getWeather(latitude: location.latitude, longitude: location.longitude)
            
        }.store(in: &subscriptions)

    }
    
    private func getWeather(latitude: Double, longitude: Double) {
        apiService
            .weather(latitude: latitude, longitude: longitude)
            .sink { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let apiError):
                    self?.errorMessage = ErrorMapper(error: apiError, context: .location).message
                case .finished:
                    print("Successfully retrieved weather")
                }
            } receiveValue: { [weak self] response in
                self?.weather = response
            }
            .store(in: &subscriptions)

    }
    
}
