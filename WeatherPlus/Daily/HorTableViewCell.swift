//
//  HorTableViewCell.swift
//  WeatherPlus
//
//  Created by Anatoli Shmanai on 8.12.20.
//

import UIKit

class HorTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var dailyCollectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dailyCollectionView.register(DailyCollectionViewCell.nib(), forCellWithReuseIdentifier: "DailyCollectionViewCell" )
//        dailyCollectionView.register(DailyCollectionViewCelll.nib(), "DailyCollectionViewCell")
        dailyCollectionView.delegate = self
        dailyCollectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyCollectionViewCell", for: indexPath) as! DailyCollectionViewCell
//        cell.configure(with: models[indexPath.row])
        return cell
    }
    

    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 20)
    }
    
    
    static func nib() -> UINib {
        return UINib(nibName: "HorTableViewCell",
                     bundle: nil)
    }
}

