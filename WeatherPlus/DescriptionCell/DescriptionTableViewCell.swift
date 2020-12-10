//
//  DescriptionTableViewCell.swift
//  WeatherPlus
//
//  Created by Anatoli Shmanai on 10.12.20.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

    
    @IBOutlet var descriptionTextLabel: UILabel!
    
    
    @IBOutlet var descriptionValueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func configure(with model: WeatherData) {
//        self.descriptionValueLabel.text = "\(model.timezone)"
////        self.iconImageView.contentMode = .scaleAspectFit
////        self.iconImageView.image = UIImage(systemName: "sun.max.fill")?.withTintColor(.systemYellow)
//        self.descriptionTextLabel.text = model.timezone
//    }

    
    
}
