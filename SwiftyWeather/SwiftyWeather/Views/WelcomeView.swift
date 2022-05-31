//
//  WelcomeView.swift
//  SwiftyWeather
//
//  Created by Nuno Mota on 31/05/2022.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var viewmodel: MainViewmodel
    
    var body: some View {
        VStack {
            VStack(spacing: 20)  {
                Text("Welcome to SwiftyWeather")
                    .bold()
                    .font(.title)
                
                Text("Please share your location to get the weather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                viewmodel.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
