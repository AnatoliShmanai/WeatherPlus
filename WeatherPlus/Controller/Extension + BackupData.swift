//
//  Extension + BackupData.swift
//  WeatherPlus
//
//  Created by Anatoli Shmanai on 11.12.20.
//

import UIKit

extension ViewController {
    
    func saveToBackup(with data: WeatherData) {

        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(data)
            try data.write(to: dataFilePath!)
        } catch  {
            print("Error encoding Item Array \(error)")
        }
    }
    
    func dataFromBackup() {
        
        if  let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            
            do {
                let backupModel = try decoder.decode(WeatherData.self, from: data)
                modelsArray.append(backupModel)
            } catch {
                print(error.localizedDescription)
            }
            
        }
       
        
    }
    
}
