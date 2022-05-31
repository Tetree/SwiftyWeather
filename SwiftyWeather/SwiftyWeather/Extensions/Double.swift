//
//  Double.swift
//  SwiftyWeather
//
//  Created by Nuno Mota on 31/05/2022.
//

import Foundation

extension Double {
    func roundDouble() -> String {
        String(format: "%.0f", self)
    }
}
