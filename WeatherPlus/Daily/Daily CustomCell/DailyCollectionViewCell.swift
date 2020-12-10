//
//  DailyCollectionViewCell.swift
//  WeatherPlus
//
//  Created by Anatoli Shmanai on 10.12.20.
//

import UIKit

class DailyCollectionViewCell: UICollectionViewCell {

    
    
    static func nib() -> UINib {
        return UINib(nibName: "DailyCollectionViewCell",
                     bundle: nil)
    }

//    @IBOutlet var iconImageView: UIImageView!
//    @IBOutlet var tempLabel: UILabel!

//    func configure(with model: HourlyWeatherEntry) {
//        self.tempLabel.text = "\(model.temperature)"
//        self.iconImageView.contentMode = .scaleAspectFit
//        self.iconImageView.image = UIImage(systemName: "sun.max.fill")?.withTintColor(.systemYellow)
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

}
