//
//  Extension + DateRormatterM.swift
//  WeatherPlus
//
//  Created by Anatoli Shmanai on 11.12.20.
//

import Foundation


extension ViewController {
    func getTimeForDate(_ date: Date?) -> String {
        guard let inputDate = date else {
            return ""
        }

        let formatter = DateFormatter()
                formatter.dateFormat = "HH:mm"

        return formatter.string(from: inputDate)
    }
}
