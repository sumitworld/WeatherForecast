//
//  weatherController.swift
//  Weather
//
//  Created by Sumit Parmar on 27/12/18.
//  Copyright © 2018 Sumit Parmar. All rights reserved.
//

import UIKit

class weatherController: UIViewController {

    //MARK: ---------- IBOUTLETS -----------
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var statusOfDate_lbl: UILabel!
    @IBOutlet var day_Date_lbl: UILabel!
    @IBOutlet var max_Min_temp_lbl: UILabel!
    @IBOutlet var Weather_lbl: UILabel!
    //MARK: ---------- OBJECTS -----------
    var weatherService: WeatherService!
    
    //MARK: ---------- VIEW DID LOAD METHOD -----------
    override func viewDidLoad() {
        super.viewDidLoad()
        displayCurrentdatewithformate()
    }
    //MARK: ---------- IBACTIONS -----------
    @IBAction func dateValueChanged(_ sender: UIDatePicker) {
        displayCurrentdatewithformate()
    }
    //MARK: ---------- FUNCTIONS -----------
    func displayCurrentdatewithformate() {
        datePicker.backgroundColor = #colorLiteral(red: 0.6039215686, green: 0.6039215686, blue: 0.6039215686, alpha: 0.3)
        datePicker.setValue(#colorLiteral(red: 0, green: 0.9568627451, blue: 0.3333333333, alpha: 1), forKey: "textColor")
        datePicker.datePickerMode = .date
        let dateformater = DateFormatter()
        dateformater.dateFormat = dateFormatStr
        getDayStringFromSelectedDate()
    }
    func getDayStringFromSelectedDate(){
        let calendar = Calendar.current
        let day = calendar.component(.day, from: datePicker.date)
        let isprimeday =   is_prime(selectedDay: day)
        if isprimeday == true {
            statusOfDate_lbl.text = "\(day) is a prime date"
            let timestamp = datePicker.date.timeIntervalSince1970
            
            weatherService = WeatherService(APIKey: WeatherAPIKey)
            showActivityIndicator(uiView: self.view)
            weatherService.getWeatherDataFromSelectedLocationAndDate(latitude: coordinate.lat, longitude: coordinate.long, unixdate:Int64(timestamp)) { (WeatherData) in
                if let WeatherData = WeatherData {
                    DispatchQueue.main.async {
                        if let mintemperature = WeatherData.mintemperature , let maxtemprature = WeatherData.maxtemperature {
                            let mintempstr = String(format: "%.0f °C", mintemperature)
                            let maxtempstr = String(format: "%.0f °C", maxtemprature)
                            self.max_Min_temp_lbl.text = "Min \(mintempstr) ~ Max \(maxtempstr)"
                        }
                        if let timestr = WeatherData.time {
                             self.day_Date_lbl.text = timestr
                        }
                        if let summrystr = WeatherData.summary{
                            self.Weather_lbl.text = summrystr
                        }
                        hideActivityIndicator(uiView: self.view)
                    }
                }
            }
        }else{
            statusOfDate_lbl.text = "\(day) is not a prime date, please select another date"
        }
    }
}
