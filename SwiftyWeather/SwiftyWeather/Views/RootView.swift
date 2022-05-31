//
//  ContentView.swift
//  SwiftyWeather
//
//  Created by Nuno Mota on 31/05/2022.
//

import SwiftUI

struct RootView: View {
    
    @ObservedObject var viewmodel: MainViewmodel
    
    var body: some View {
        VStack {
            if let errorMessage = viewmodel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.white)
            }else {
                if viewmodel.hasLocation  {
                    if let weather = viewmodel.weather {
                        WeatherView(weather: weather)
                    }else {
                        LoadingView()
                    }
                    
                }else {
                    if viewmodel.isLoading  {
                        LoadingView()
                    }else {
                        WelcomeView()
                            .environmentObject(viewmodel)
                    }
                }
            }
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(viewmodel: MainViewmodel(apiService: APIClient(), locationService: LocationManager()))
    }
}
