//
//  JsonUtil.swift
//  WeatherAppTests
//
//  Created by MANISH PATHAK
//
import Foundation
import ObjectMapper
@testable import WeatherApp

class JSONUtil {

    class func readJSON(from jsonFileName: String) -> Data? {
        if let path = Bundle.main.path(forResource: jsonFileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                return nil
            }
        }
        return nil
    }

    class func getWeathers() -> WeatherModel? {
        guard let data = readJSON(from: "weatherList") else {
            return nil
        }
        let resultModel = try! JSONDecoder().decode(WeatherModel.self, from: data)
        return resultModel
    }
}
