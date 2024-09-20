//
//  MockListPresenter.swift
//  WeatherAppTests
//
//  Created by MANISH PATHAK
//

@testable import WeatherApp

class MockListPresenter :WeatherListInteractorOutputProtocol {
    var mock_didRetrieveWeather_calls = 0
    var mock_onError_calls = 0
    
    func onError() {
        mock_onError_calls += 1
    }
    
    func didRetrieveWeather(_ weatherModel: WeatherApp.WeatherModel) {
        mock_didRetrieveWeather_calls += 1
    }
}
