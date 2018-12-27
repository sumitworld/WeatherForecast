//
//  WeatherData.swift
//  Weather
//
//  Created by Sumit Parmar on 27/12/18.
//  Copyright © 2018 Sumit Parmar. All rights reserved.
//

import Foundation

class WeatherData{
   let mintemperature: Double?
   let maxtemperature: Double?
   let time: String?
   let summary: String?

    struct weatherParamsKeys {
        static let mintemperature = "temperatureMin"
        static let maxtemperature = "temperatureMax"
        static let time = "time"
        static let summary = "summary"
    }
    
   init(weatherDataDictionary: [String : Any]){
        mintemperature = weatherDataDictionary[weatherParamsKeys.mintemperature] as? Double
        maxtemperature = weatherDataDictionary[weatherParamsKeys.maxtemperature] as? Double
       // time = weatherDictionary[WeatherKeys.time] as? Int64
        if let timestap = weatherDataDictionary[weatherParamsKeys.time] as? Int64{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = dateFormatStr
           // dateFormatter.timeStyle = .none
            let tdate = Date(timeIntervalSince1970: TimeInterval(timestap))
            time = dateFormatter.string(from: tdate)
            
        }else{
            time = nil
        }
        
        summary = weatherDataDictionary[weatherParamsKeys.summary] as? String
    }
}

