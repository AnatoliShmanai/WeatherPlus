//
//  Extension + TableView.swift
//  WeatherPlus
//
//  Created by Anatoli Shmanai on 11.12.20.
//

import UIKit

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (descriptionHeaderArray.count + 2)

    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HorTableViewCell", for: indexPath) as! HorTableViewCell
            cell.configure(with: modelsArray)
            return cell
        
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
            if !modelsArray.isEmpty {
                
                cell.textLabel?.text = "Сегодня: Сейчас \(modelsArray[0].current.weather[0].description). Температура воздуха \(String(format: "%.f", modelsArray[0].current.temp))°, максимальная температура воздуха \(String(format: "%.f", modelsArray[0].daily[0].temp.max))°."
            }
            cell.textLabel?.textColor = .white
            cell.textLabel?.numberOfLines = 0
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as! DescriptionTableViewCell
            
            if !modelsArray.isEmpty {
                switch indexPath.row {
                case 2:
                    cell.descriptionTextLabel.text = descriptionHeaderArray[indexPath.row - 2]
                    cell.descriptionValueLabel.text = self.getTimeForDate(Date(timeIntervalSince1970: Double(modelsArray[0].current.sunrise)))
                case 3:
                    cell.descriptionTextLabel.text = descriptionHeaderArray[indexPath.row - 2]
                    cell.descriptionValueLabel.text = self.getTimeForDate(Date(timeIntervalSince1970: Double(modelsArray[0].current.sunset)))
                case 4:
                    cell.descriptionTextLabel.text = descriptionHeaderArray[indexPath.row - 2]
                    cell.descriptionValueLabel.text = String(modelsArray[0].current.humidity) + "%"
                case 5:
                    cell.descriptionTextLabel.text = descriptionHeaderArray[indexPath.row - 2]
                    cell.descriptionValueLabel.text = String(format: "%.f", modelsArray[0].current.wind_speed) + " м/с"
                case 6:
                    cell.descriptionTextLabel.text = descriptionHeaderArray[indexPath.row - 2]
                    cell.descriptionValueLabel.text = String(format: "%.1f", modelsArray[0].current.feels_like) + "°"
                    
                case 7:
                    cell.descriptionTextLabel.text = descriptionHeaderArray[indexPath.row - 2]
                    cell.descriptionValueLabel.text = String(format: "%.1f", (Double(modelsArray[0].current.pressure) / 133.0 * 100.0)) + " мм рт. ст."
                case 8:
                    cell.descriptionTextLabel.text = descriptionHeaderArray[indexPath.row - 2]
                    cell.descriptionValueLabel.text = String(format: "%.1f", modelsArray[0].current.visibility / 1000.0) + " км"
                case 9:
                    cell.descriptionTextLabel.text = descriptionHeaderArray[indexPath.row - 2]
                    cell.descriptionValueLabel.text = String(format: "%.f", modelsArray[0].current.uvi)
                    
                default:
                    print("no header")
                }
            }
            
            
             return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 300
        case 1:
            return 100
            
        default:
            return 70
            
        }
    }
    
}
