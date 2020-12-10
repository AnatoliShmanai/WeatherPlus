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

    
    static let identifier = "HoulectionViewCellrlyCol"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    static func nib() -> UINib {
        return UINib(nibName: "HourlyCollectionViewCell",
                     bundle: nil)
    }

    
    func configure(with model: WeatherData) {
        self.tempLabel.text = "\(model.main.temp)"
//        self.iconImageView.contentMode = .scaleAspectFit
//        self.iconImageView.image = UIImage(systemName: "sun.max.fill")?.withTintColor(.systemYellow)
        self.timeLabel.text = model.name
    }

   

}
