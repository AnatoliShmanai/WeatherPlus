//
//  ViewController.swift
//  WeatherPlus
//
//  Created by Anatoli Shmanai on 8.12.20.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    let maxHeaderHeight: CGFloat = 320
    let minHeaderHeight: CGFloat = 120
    var previousScrollOffset: CGFloat = 0
    
    let locationManager = CLLocationManager()
    var weatherManager = WeatherManager()
    
    var myArray = [WeatherData]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    
    @IBOutlet weak var minMaxCurrentLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
   
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        weatherManager.delegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    
        tableView.register(HorTableViewCell.nib(), forCellReuseIdentifier: "HorTableViewCell")

        
//        let cell = UINib(nibName: "myCellTableViewCell", bundle: nil)
//        tableView.register(cell, forCellReuseIdentifier: "myCell")

    }
    
    
}







//MARK:- TableVIew

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20

    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HorTableViewCell", for: indexPath) as! HorTableViewCell
            cell.backgroundColor = .clear
            return cell
//        case 1:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
//            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            print(myArray)
             return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 250
//        case 1:
//            return 90
            
        default:
            return 70
            
        }
    }
    
}


//MARK:- Animation Header View

extension ViewController {
    func canAnimateHeader (_ scrollView: UIScrollView) -> Bool {
        let scrollViewMaxHeight = scrollView.frame.height + self.headerViewHeight.constant - minHeaderHeight
        return scrollView.contentSize.height > scrollViewMaxHeight
    }
    func setScrollPosition() {
        self.tableView.contentOffset = CGPoint(x:0, y: 0)
    }
}
extension ViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollDiff = (scrollView.contentOffset.y - previousScrollOffset)
        let isScrollingDown = scrollDiff > 0
        let isScrollingUp = scrollDiff < 0
        if canAnimateHeader(scrollView) {
            var newHeight = headerViewHeight.constant
            if isScrollingDown {
                newHeight = max(minHeaderHeight, headerViewHeight.constant - abs(scrollDiff))
                DispatchQueue.main.async {
                    self.tempLabel.isHidden = true
                    self.minMaxCurrentLabel.isHidden = true
                }
                
            } else if isScrollingUp {
                newHeight = min(maxHeaderHeight, headerViewHeight.constant + abs(scrollDiff))
                DispatchQueue.main.async {
                    self.tempLabel.isHidden = false
                    self.minMaxCurrentLabel.isHidden = false
                }
            }
            if newHeight != headerViewHeight.constant {
                headerViewHeight.constant = newHeight
                setScrollPosition()
                previousScrollOffset = scrollView.contentOffset.y
            }
        }
    }
    
}


//MARK:- CollectionView

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
           return CGSize(width: 100.0, height: 120.0)
        }
    
    
}


// MARK:- CLLocation Delegate

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            // Here we capture coordinates and call fetch weather
            
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}

//MARK:- WeatherManagerDelegate


extension ViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatgerManager: WeatherManager, weather: WeatherData) {
        DispatchQueue.main.async {
            
            // Here we get data from model and setup UI
            
            
            self.tempLabel.text = String(format: "%.f", weather.main.temp)
            self.descriptionLabel.text = weather.weather[0].description
            self.minMaxCurrentLabel.text = "мин. \(String(format: "%.f", weather.main.temp_min))°, макс \(String(format: "%.f", weather.main.temp_max))°"
            self.myArray.append(weather)
            

        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
