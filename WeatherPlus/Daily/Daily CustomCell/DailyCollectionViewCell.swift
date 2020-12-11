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

    

}

