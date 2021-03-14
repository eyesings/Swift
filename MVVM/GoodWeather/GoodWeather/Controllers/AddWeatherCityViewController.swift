//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Kim Tae won on 2021/03/08.
//

import Foundation
import UIKit

class AddWeatherCityViewController: UIViewController {
    
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func saveCityButtonPress() {
        
        if let city = cityNameTextField.text {
            
            let weatherURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=75007ac181234e2c005023902fdbbbc6&units=imperial")!
            
            let weatherResource = Resource<Any>(url: weatherURL) { (data) in
                
                return data
            }
            
            Webservice().load(resource: weatherResource) { (result) in
                
            }
            
        }
        
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
