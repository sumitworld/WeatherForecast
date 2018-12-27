//
//  WeatherService.swift
//  Weather
//
//  Created by Sumit Parmar on 27/12/18.
//  Copyright © 2018 Sumit Parmar. All rights reserved.
//

import Foundation
import Alamofire

class WeatherService{
    let weatherAPIKey: String
    let weatherBaseURL: URL?
    
    init(APIKey: String)
    {
        self.weatherAPIKey = APIKey
        weatherBaseURL = URL(string: "\(baseURL)\(APIKey)")
    }
    
    func getWeatherDataFromSelectedLocationAndDate(latitude: Double, longitude: Double,unixdate: Int64, completion: @escaping (WeatherData?) -> Void)
    {
        if let weatherforecastURL = URL(string: "\(weatherBaseURL!)/\(latitude),\(longitude),\(unixdate)") {
            
            Alamofire.request(weatherforecastURL).responseJSON(completionHandler: { (response) in
                if let jsonDictionary = response.result.value as? [String : Any] {
                    if let currentWeatherDictionary = jsonDictionary["daily"] as? [String : Any] , let dailyweatherdataArray = currentWeatherDictionary["data"] as? [NSDictionary] , let dailyweatherdatadic = dailyweatherdataArray[0] as? [String: Any] {
                        let dailyWeather = WeatherData(weatherDataDictionary: dailyweatherdatadic)
                        completion(dailyWeather)
                    } else {
                        completion(nil)
                    }
                }
            })
        }
        
    }
}
