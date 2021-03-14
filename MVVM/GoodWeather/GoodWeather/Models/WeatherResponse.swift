//
//  WeatherResponse.swift
//  GoodWeather
//
//  Created by Kim Tae won on 2021/03/15.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
