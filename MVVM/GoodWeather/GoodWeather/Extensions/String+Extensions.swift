//
//  String+Extensions.swift
//  GoodWeather
//
//  Created by Kim Tae won on 2021/03/15.
//

import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
