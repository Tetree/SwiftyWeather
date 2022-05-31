//
//  Environment.swift
//  SwiftyWeather
//
//  Created by Nuno Mota on 31/05/2022.
//

import Foundation

enum Environment {

    // MARK: - OpenWeather Base URL
    static var baseUrlString: String {
        "https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={APIkey}"
    }

    static var apiToken: String {
        "73fbf83cee405cc71e01b68eaab98766"
    }
    
    static var latPath:String {
        "{lat}"
    }
    
    static var lonPath:String {
        "{lon}"
    }
    
    static var apiKeyPath:String {
        "{APIkey}s"
    }

}
