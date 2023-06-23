//
//  Weather.swift
//  DIO-MAPS-TASKS
//
//  Created by Mateus Rodrigues on 28/05/23.
//

import Foundation
//https://www.weatherapi.com/docs/
struct Weather: Decodable {
    let the_temp: Float
    let min_temp: Float
    let max_temp: Float
  
    func mainTemperature() -> String {
        let temp = format(number: self.the_temp)
        return temp + "ºC"
    }
    
    func minTemperature() -> String {
        let temp = format(number: self.min_temp)
        return temp + "ºC"
    }
    
    func maxTemperature() -> String {
        let temp = format(number: self.max_temp)
        return temp + "ºC"
    }
    
    private func format(number: Float) -> String {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = false
        return formatter.string(from: NSNumber(value: number))!
        
    }
}
