//
//  ViewController.swift
//  WeatherPlus
//
//  Created by Anatoli Shmanai on 8.12.20.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var minMaxCurrentLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
   
    let maxHeaderHeight: CGFloat = 320
    let minHeaderHeight: CGFloat = 120
    var previousScrollOffset: CGFloat = 0
    
    let locationManager = CLLocationManager()
    var weatherManager = WeatherManager()
    
    var modelsArray = [WeatherData]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("WeatherBackup.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self

        weatherManager.delegate = self
        
        locationManager.delegate = self
        
        
        
        locationManager.requestWhenInUseAuthorization()
        
        dataFromBackup()
        
        if !modelsArray.isEmpty {
            didUpdateWeather(weatherManager, weather: modelsArray[0])
        }
        
        locationManager.requestLocation()
    
        tableView.register(HorTableViewCell.nib(), forCellReuseIdentifier: "HorTableViewCell")
        collectionView.register(HourlyCollectionViewCell.nib(), forCellWithReuseIdentifier: "HourlyCollectionViewCell")

        tabBarController?.view.backgroundColor = .clear
        
       
        
    }
    
    
    
}








