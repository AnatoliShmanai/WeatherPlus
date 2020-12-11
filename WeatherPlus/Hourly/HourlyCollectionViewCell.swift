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
  
    
    

}

