//
//  WeatherListRemoteDataManager.swift
//  WeatherApp
//
//  Created by MANISH PATHAK
//

import Quick
import Nimble

@testable import WeatherApp

// NOTE: Facing an issue in mocking the Alamofire library
class WeatherListRemoteDataManagerSpec: QuickSpec {
    var weatherListRemoteDataManager: WeatherListRemoteDataManagerInputProtocol?

    private func setupModule(){
        self.weatherListRemoteDataManager = WeatherListRemoteDataManager()
        self.weatherListRemoteDataManager?.remoteRequestHandler = MockRemoteOutputDataManager()
    }

    override func spec() {
        describe("WeatherListRemoteDataManager") {
            beforeEach {
                self.setupModule()
            }
        }
    }
}
