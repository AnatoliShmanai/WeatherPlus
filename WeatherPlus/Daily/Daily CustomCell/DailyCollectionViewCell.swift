//
//  DailyCollectionViewCell.swift
//  WeatherPlus
//
//  Created by Anatoli Shmanai on 10.12.20.
//

import UIKit

class DailyCollectionViewCell: UICollectionViewCell {

    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var maxTemp: UILabel!
    @IBOutlet var minTemp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "DailyCollectionViewCell",
                     bundle: nil)
    }

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
        formatter.dateFormat = "EEEE" // Monday
//                formatter.dateFormat = "HH" // Hours

        return formatter.string(from: inputDate)
    }
   

}

extension DailyCollectionViewCell {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
            contentMode = mode
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else { return }
                DispatchQueue.main.async() { [weak self] in
                    self?.iconImageView.image = image
                }
            }.resume()
        }
        func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
            guard let url = URL(string: link) else { return }
            downloaded(from: url, contentMode: mode)
        }
}
