//
//  WeatherView.swift
//  SwiftyWeather
//
//  Created by Nuno Mota on 31/05/2022.
//

import SwiftUI

struct WeatherView: View {
    var weather: WeatherResponse
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(weather.name)")
                        .font(.title)
                        .bold()
                    
                    Text("Today, \(Date().formatted())")
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                WeatherCenterView(weather: weather)
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min Temp", value: "\(weather.main.tempMin)" + "º")
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer", name: "Max Temp", value: "\(weather.main.tempMax)" + "º")
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: "\(weather.wind.speed)" + "m/s")
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())" + "%")
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
            }
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(ColorConstants.backgroundColor)
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: Helpers.stubData(for: "PreviewWeatherResponse"))
    }
}

