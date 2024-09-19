//
//  Endpoints.swift
//  WeatherApp
//
//  Created by MANISH PATHAK
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Weather: Endpoint {
        case fetch(city: String)

        public var path: String {
            switch self {   
            case .fetch(city: let city): return
                String.init(format: "/data/2.5/forecast?q=%@&appid=%@&units=metric", city, Constants.AppAPI.key)
            }
        }

        public var url: String {
            switch self {
            case .fetch(city: let city): return "\(Constants.AppAPI.baseUrl)\(Weather.fetch(city: city).path)"
            }
        }
    }
}
