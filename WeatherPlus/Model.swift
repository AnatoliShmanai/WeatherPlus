//
//  Model.swift
//  TestTableView
//
//  Created by Anatoli Shmanai on 8.12.20.
//

import Foundation


struct Model {
    var day: String = ""
    var minTemp: Int = 0
    var maxTemp: Int = 0
    var imageName: String = "sun"
    var humidity: Int = 0
    var time: Int = 0
    
}


var models = [Model(day: "Понедельник", minTemp: -2, maxTemp: -1, imageName: "sun", humidity: 60, time: 11), Model(day: "Вторник", minTemp: -2, maxTemp: 0, imageName: "sun", humidity: 70, time: 12), Model(day: "Среда", minTemp: -2, maxTemp: -1, imageName: "sun", humidity: 40, time: 14), Model(day: "Понедельник", minTemp: -2, maxTemp: -1, imageName: "sun", humidity: 60, time: 11),Model(day: "Понедельник", minTemp: -2, maxTemp: -1, imageName: "sun", humidity: 60, time: 11)]


