//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by MANISH PATHAK
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    @IBOutlet private weak var weatherTitle: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var weatherSubtitleLeft: UILabel!
    @IBOutlet private weak var weatherSubtitleRight: UILabel!
    
    func populate(weatherList: [WeatherList], indexPath: IndexPath) {
        
        let dateText = weatherList[indexPath.row].dtTxt
        let dateTimestamp = weatherList[indexPath.row].dt
        let weatherInfoMain = weatherList[indexPath.row].main
        let wind = weatherList[indexPath.row].wind
        let weatherinfo = weatherList[indexPath.row].weather?.first?.descriptionField

        weatherTitle.text = "Temprature: \(weatherInfoMain?.temp ?? 0)"
        weatherSubtitleLeft.text = "Humidity: \(weatherInfoMain?.humidity ?? 0)\nWind Speed: \(wind?.speedWind ?? 0)"
        weatherSubtitleRight.text = "Min Temp: \(weatherInfoMain?.tempMin ?? 0)\n Max Temp: \(weatherInfoMain?.tempMax ?? 0)"
        
        let restoredDate = Date(timeIntervalSince1970: Double(dateTimestamp ?? 0 ))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.DateFormat.YYYYMMDD_HHMMSS
        dateLabel.text = dateFormatter.string(from: restoredDate)
    }
}
