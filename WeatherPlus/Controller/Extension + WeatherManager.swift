//
//  Extension + WeatherManager.swift
//  WeatherPlus
//
//  Created by Anatoli Shmanai on 11.12.20.
//

import UIKit


extension ViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatgerManager: WeatherManager, weather: WeatherData) {
        
        self.modelsArray = [weather]
        
        // Save data to backup
        saveToBackup(with: weather)
        //
        
        DispatchQueue.main.async {
            
            // Here we get data from model and setup UI
            self.collectionView.reloadData()
            self.tableView.reloadData()
            self.cityNameLabel.text = weather.timezone
            self.tempLabel.text = String(format: "%.f", weather.current.temp) + "°"
            self.descriptionLabel.text = weather.current.weather[0].description
            self.minMaxCurrentLabel.text = "мин. \(String(format: "%.f", weather.daily[0].temp.min))°, макс \(String(format: "%.f", weather.daily[0].temp.max))°"

        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
