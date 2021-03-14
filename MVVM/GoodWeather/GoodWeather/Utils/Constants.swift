//
//  Constants.swift
//  GoodWeather
//
//  Created by Kim Tae won on 2021/03/15.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static func urlForWeatherByCity(city: String) -> URL {
            
            let userDefaults = UserDefaults.standard
            let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
            
            return URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=75007ac181234e2c005023902fdbbbc6&units=\(unit)")!
            
        }
        
    }
    
}
