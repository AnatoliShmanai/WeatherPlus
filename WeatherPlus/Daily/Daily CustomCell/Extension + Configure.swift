//
//  Extension + Configure.swift
//  WeatherPlus
//
//  Created by Anatoli Shmanai on 11.12.20.
//

import UIKit

extension DailyCollectionViewCell {
    
    func configure(with model: WeatherData, and indexPath: IndexPath) {
        
        self.dayLabel.text = getDayForDate(Date(timeIntervalSince1970: Double(model.daily[indexPath.row].dt)))

        downloaded(from: "http://openweathermap.org/img/wn/\(model.daily[indexPath.row].weather[0].icon)@2x.png")

        self.humidityLabel.text = String(model.daily[indexPath.row].humidity) + " %"
        self.maxTemp.text = String(format: "%.f", model.daily[indexPath.row].temp.max) + "°"
        self.minTemp.text = String(format: "%.f", model.daily[indexPath.row].temp.min) + "°"
    }
    
    func getDayForDate(_ date: Date?) -> String {
        guard let inputDate = date else {
            return ""
        }

        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "EEEE" 

        return formatter.string(from: inputDate)
    }
   
}
