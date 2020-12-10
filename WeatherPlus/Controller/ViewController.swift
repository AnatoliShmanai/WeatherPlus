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
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
   
    
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
        collectionView.register(HourlyCollectionViewCell.nib(), forCellWithReuseIdentifier: "HourlyCollectionViewCell")

        
//        let cell = UINib(nibName: "myCellTableViewCell", bundle: nil)
//        tableView.register(cell, forCellReuseIdentifier: "myCell")

    }
    
    
}







//MARK:- TableVIew

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (descriptionHeaderArray.count + 2)

    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HorTableViewCell", for: indexPath) as! HorTableViewCell
            cell.backgroundColor = .clear
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
            if !myArray.isEmpty {
                
                cell.textLabel?.text = "Сегодня: Сейчас \(myArray[0].current.weather[0].description). Температура воздуха \(String(format: "%.f", myArray[0].current.temp))°, максимальная температура воздуха \(String(format: "%.f", myArray[0].daily[0].temp.max))°."
                
            }
            cell.textLabel?.textColor = .white
//            cell.textLabel?.textAlignment = .
            cell.textLabel?.numberOfLines = 0
            
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as! DescriptionTableViewCell
            
            if !myArray.isEmpty {
//                cell.configure(with: myArray[0])
                switch indexPath.row {
                case 2:
                    cell.descriptionTextLabel.text = descriptionHeaderArray[indexPath.row - 2]
                    cell.descriptionValueLabel.text = self.getTimeForDate(Date(timeIntervalSince1970: Double(myArray[0].current.sunrise)))
                case 3:
                    cell.descriptionTextLabel.text = descriptionHeaderArray[indexPath.row - 2]
                    cell.descriptionValueLabel.text = self.getTimeForDate(Date(timeIntervalSince1970: Double(myArray[0].current.sunset)))
                case 4:
                    cell.descriptionTextLabel.text = descriptionHeaderArray[indexPath.row - 2]
                    cell.descriptionValueLabel.text = String(myArray[0].current.humidity) + "%"
                case 5:
                    cell.descriptionTextLabel.text = descriptionHeaderArray[indexPath.row - 2]
                    cell.descriptionValueLabel.text = String(format: "%.f", myArray[0].current.wind_speed) + " м/с"
                case 6:
                    cell.descriptionTextLabel.text = descriptionHeaderArray[indexPath.row - 2]
                    cell.descriptionValueLabel.text = String(format: "%.1f", myArray[0].current.feels_like) + "°"
                    
                case 7:
                    cell.descriptionTextLabel.text = descriptionHeaderArray[indexPath.row - 2]
                    cell.descriptionValueLabel.text = String(format: "%.1f", (Double(myArray[0].current.pressure) / 133.0 * 100.0)) + " мм рт. ст."
                case 8:
                    cell.descriptionTextLabel.text = descriptionHeaderArray[indexPath.row - 2]
                    cell.descriptionValueLabel.text = String(format: "%.1f", myArray[0].current.visibility / 1000.0) + " км"
                case 9:
                    cell.descriptionTextLabel.text = descriptionHeaderArray[indexPath.row - 2]
                    cell.descriptionValueLabel.text = String(format: "%.f", myArray[0].current.uvi)
                    
                default:
                    print("no header")
                }
            }
            
            
             return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 250
        case 1:
            return 100
            
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
        if !myArray.isEmpty {
            return myArray[0].hourly.count
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourlyCollectionViewCell", for: indexPath) as! HourlyCollectionViewCell
        if !myArray.isEmpty {
            cell.configure(with: myArray[0], and: indexPath )
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
           return CGSize(width: 60.0, height: 120.0)
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
        
        self.myArray.append(weather)
        
        DispatchQueue.main.async {
            
            // Here we get data from model and setup UI
            self.collectionView.reloadData()
            self.tableView.reloadData()
            self.cityNameLabel.text = weather.timezone
            self.tempLabel.text = String(format: "%.f", weather.current.temp) + "°"
            self.descriptionLabel.text = weather.current.weather[0].description
            self.minMaxCurrentLabel.text = "мин. \(String(format: "%.f", weather.daily[0].temp.min))°, макс \(String(format: "%.f", weather.daily[0].temp.max))°"

        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}

//MARK:- DateFoematter

extension ViewController {
    func getTimeForDate(_ date: Date?) -> String {
        guard let inputDate = date else {
            return ""
        }

        let formatter = DateFormatter()
//        formatter.dateFormat = "EEEE" // Monday
                formatter.dateFormat = "HH:mm" // Hours

        return formatter.string(from: inputDate)
    }
}
