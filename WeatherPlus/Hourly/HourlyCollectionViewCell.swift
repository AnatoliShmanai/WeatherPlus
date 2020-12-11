//
//  HourlyCollectionViewCell.swift
//  WeatherPlus
//
//  Created by Anatoli Shmanai on 10.12.20.
//

import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    
    static let identifier = "HoulectionViewCellrlyCol"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    static func nib() -> UINib {
        return UINib(nibName: "HourlyCollectionViewCell",
                     bundle: nil)
    }

    
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
//        formatter.dateFormat = "EEEE" // Monday
                formatter.dateFormat = "HH" // Hours

        return formatter.string(from: inputDate)
    }
   

}

extension HourlyCollectionViewCell {
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
