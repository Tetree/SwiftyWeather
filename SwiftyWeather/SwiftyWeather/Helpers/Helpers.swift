//
//  Helpers.swift
//  SwiftyWeather
//
//  Created by Nuno Mota on 31/05/2022.
//

import Foundation

enum Helpers {
    
    static func stubData<T: Decodable>(for resource: String) -> T {
        guard
            let url = Bundle.main.url(forResource: resource, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let stubData = try? JSONDecoder().decode(T.self, from: data)
        else {
            fatalError("Unable to Load Stub Data")
        }

        return stubData
    }
    
}
