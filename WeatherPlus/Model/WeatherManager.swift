//
//  WeatherManager.swift
//  WeatherPlus
//
//  Created by Anatoli Shmanai on 10.12.20.
//

import Foundation
import CoreLocation


protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatgerManager: WeatherManager, weather: WeatherData)
    func didFailWithError(error: Error)
}


struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/onecall?exclude=minutely&appid=0aa5886e3a2c2ad1cb6debedc3c9e28d&lang=ru&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = weatherURL + "&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        // 1. create url
        guard let url = URL(string: urlString) else { return }
        // 2. create a urlsession
        let session = URLSession(configuration: .default)
        // 3. give the session a task
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                self.delegate?.didFailWithError(error: error!)
                return
            }
            if let safeData = data {
                if let weather = self.parseJSON(safeData) {
                    self.delegate?.didUpdateWeather(self, weather: weather)
                }
            }
        }
        // 4. start the task
        task.resume()
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            return decodedData
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
