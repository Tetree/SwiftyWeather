//
//  WeatherCenterView.swift
//  SwiftyWeather
//
//  Created by Nuno Mota on 31/05/2022.
//

import SwiftUI

struct WeatherCenterView: View {
    var weather: WeatherResponse
    var body: some View {
        VStack {
            HStack {
                
                VStack(spacing: 20) {
                    Image(systemName: "sun.max")
                        .font(.system(size: 40))
                    
                    Text(weather.weather[0].main)
                }
                .frame(width: 150, alignment: .leading)
                
                Spacer()
                
                Text("\(weather.main.feelsLike.roundDouble())" + "º")
                    .font(.system(size: 90))
                    .fontWeight(.bold)
                    .padding()
            }
            
            Spacer()
                .frame(height: 80)
            
            
            AsyncImage(url: URL(string:"https://www.path2usa.com/images/articles/usaclimate.jpg")) { image in
                
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350)
                
            } placeholder: {
                ProgressView()
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

struct WeatherCenterView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCenterView(weather: Helpers.stubData(for: "PreviewWeatherResponse"))
    }
}
