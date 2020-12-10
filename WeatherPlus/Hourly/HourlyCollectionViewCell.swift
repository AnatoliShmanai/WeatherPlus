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
        self.tempLabel.text = String(format: "%.f", model.hourly[indexPath.row].temp) + "°"
//        self.iconImageView.contentMode = .scaleAspectFit
//        self.iconImageView.image = UIImage(systemName: "sun.max.fill")?.withTintColor(.systemYellow)
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
