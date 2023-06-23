//
//  WeatherViewController.swift
//  DIO-MAPS-TASKS
//
//  Created by Mateus Rodrigues on 28/05/23.
//

import Foundation
import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var mainTemperature: UILabel!
    @IBOutlet weak var minTemperature: UILabel!
    @IBOutlet weak var maxTemperature: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        getWeather()
    }
    
    private func getWeather() {
        WeatherRepository().getWeather { (predications) in
            let todayPredication = predications[0]
            
            DispatchQueue.main.async {
                self.mainTemperature.text = todayPredication.mainTemperature()
                self.minTemperature.text = "Min: " + todayPredication.minTemperature()
                self.maxTemperature.text = "Max: " + todayPredication.maxTemperature()
            }
            
        }
    }
}
