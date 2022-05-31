//
//  SwiftyWeatherApp.swift
//  SwiftyWeather
//
//  Created by Nuno Mota on 31/05/2022.
//

import SwiftUI

@main
struct SwiftyWeatherApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(viewmodel: MainViewmodel(apiService: APIClient(), locationService: LocationManager()))
        }
    }
}
