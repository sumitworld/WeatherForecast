//
//  WeatherForecastTests.swift
//  WeatherForecastTests
//
//  Created by Sumit Parmar on 27/12/18.
//  Copyright © 2018 Sumit Parmar. All rights reserved.
//

import XCTest
@testable import WeatherForecast

class WeatherForecastTests: XCTestCase {

    func testValidUrlAndApIKeyInfo(){
        XCTAssertEqual(baseURL, "https://api.darksky.net/forecast/")
        XCTAssertEqual(WeatherAPIKey, "19adbf98614c66d4c37fe843c41738a9")
    }
    
    func testDateFormateStr(){
        XCTAssertEqual(dateFormatStr, "EEEE dd/MM/yyyy")
    }
    
}
