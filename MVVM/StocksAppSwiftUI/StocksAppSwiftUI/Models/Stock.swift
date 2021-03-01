//
//  Stock.swift
//  StocksAppSwiftUI
//
//  Created by Kim Tae won on 2021/03/01.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
