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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
