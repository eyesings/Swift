//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Kim Tae won on 2021/03/08.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let resouce = Resource<WeatherResponse>(url: URL(string: "http://api.openweathermap.org/data/2.5/weather?q=seoul&appid=75007ac181234e2c005023902fdbbbc6&units=imperial")!) { (data)  in
            
            return try? JSONDecoder().decode(WeatherResponse.self, from: data)
        }
        
        Webservice().load(resource: resouce) { (weatherResponse) in
            
            if let weatherResponse = weatherResponse {
                print(weatherResponse)
            }
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        cell.cityNameLabel.text = "Houston"
        cell.temperatureLabel.text = "70°"
        return cell
    }
    
}
