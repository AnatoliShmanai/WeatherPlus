//
//  HorTableViewCell.swift
//  WeatherPlus
//
//  Created by Anatoli Shmanai on 8.12.20.
//

import UIKit

class HorTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var dailyCollectionView: UICollectionView!
    
    var dailyArray = [WeatherData]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dailyCollectionView.register(DailyCollectionViewCell.nib(), forCellWithReuseIdentifier: "DailyCollectionViewCell" )
        dailyCollectionView.delegate = self
        dailyCollectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "HorTableViewCell",
                     bundle: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyCollectionViewCell", for: indexPath) as! DailyCollectionViewCell
        if !dailyArray.isEmpty {
            
            cell.configure(with: dailyArray[0], and: indexPath)
        }
        return cell
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 368, height: 23 )
    }
    
    
    func configure(with weather: [WeatherData]) {
        self.dailyArray = weather
        DispatchQueue.main.async {
            self.dailyCollectionView.reloadData()
        }
    }
}

