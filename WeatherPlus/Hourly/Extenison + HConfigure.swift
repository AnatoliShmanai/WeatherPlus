//
//  Extenison + HConfigure.swift
//  WeatherPlus
//
//  Created by Anatoli Shmanai on 11.12.20.
//

import UIKit


extension HourlyCollectionViewCell {
    
    func configure(with model: WeatherData, and indexPath: IndexPath) {
        downloaded(from: "http://openweathermap.org/img/wn/\(model.hourly[indexPath.row].weather[0].icon)@2x.png")

        self.tempLabel.text = String(format: "%.f", model.hourly[indexPath.row].temp) + "°"
        self.timeLabel.text = getDayForDate(Date(timeIntervalSince1970: Double(model.hourly[indexPath.row].dt)))
        self.humidityLabel.text = String(model.hourly[indexPath.row].humidity) + " %"
    }
    
    func getDayForDate(_ date: Date?) -> String {
        guard let inputDate = date else {
            return ""
        }

        let formatter = DateFormatter()
                formatter.dateFormat = "HH"

        return formatter.string(from: inputDate)
    }
}
