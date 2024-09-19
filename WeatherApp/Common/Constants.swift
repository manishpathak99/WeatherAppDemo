//
//  Constants.swift
//  WeatherApp
//
//  Created by MANISH PATHAK
//

import UIKit

class Constants {
    
    struct AppUI {
        struct Indicator {
            static let x = 0
            static let y = 0
            static let width = 80
            static let height = 80
            static let color: UIColor = .gray
        }
    }
    
    struct Search {
        static let defaultText = "Dubai"
    }
    
    struct AppAPI {
        static let key = "372644c8649ec98cde03261d1ec36ffa"
        static let baseUrl = "https://api.openweathermap.org"
    }
    
    struct DateFormat {
        static let YYYYMMDD_HHMMSS = "yyyy-MM-dd HH:mm:ss"
    }
}
