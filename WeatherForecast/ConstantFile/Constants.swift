//
//  Constants.swift
//  WeatherApp
//
//  Created by Sumit Parmar on 27/12/18.
//  Copyright © 2018 Sumit Parmar. All rights reserved.
//

import Foundation
import UIKit
// -------------- CONSTANTS -------------------

// BaseURL
var baseURL: String {
    get {
        return "https://api.darksky.net/forecast/"
    }
}

/***** API Credentials *****/
let WeatherAPIKey = "19adbf98614c66d4c37fe843c41738a9"

// API CONSTANT
let coordinate: (lat: Double, long: Double) = (18.5612,73.7624) // sus gaon,pune
let dateFormatStr = "EEEE dd/MM/yyyy"


// Objects
let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
let loadingView: UIView = UIView()

// Common Methods
func showActivityIndicator(uiView: UIView) {
    loadingView.isHidden = false
    loadingView.frame =  CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
    loadingView.center = uiView.center
    loadingView.backgroundColor = #colorLiteral(red: 0.2666666667, green: 0.2666666667, blue: 0.2666666667, alpha: 0.7)
    loadingView.clipsToBounds = true
    loadingView.layer.cornerRadius = 10
    
    actInd.frame = CGRect(x: 0.0, y: 0.0, width: 60.0, height: 60.0)
    actInd.hidesWhenStopped = true
    actInd.style =
        UIActivityIndicatorView.Style.whiteLarge
    actInd.center = CGPoint(x:loadingView.frame.size.width / 2,
                            y:loadingView.frame.size.height / 2);
    loadingView.addSubview(actInd)
    uiView.addSubview(loadingView)
    actInd.startAnimating()
}
func  hideActivityIndicator(uiView: UIView){
    loadingView.isHidden = true
    actInd.stopAnimating()
}
func is_prime(selectedDay: Int) -> Bool{
    guard selectedDay > 1 else {
        return false
    }
    for i in 2..<selectedDay {
        if selectedDay % i == 0 {
            return false
        }
    }
    return true
}
