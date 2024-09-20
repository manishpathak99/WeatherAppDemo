//
//  MockRemoteOutputDataManager.swift
//  WeatherAppTests
//
//  Created by MANISH PATHAK
//

@testable import WeatherApp

class MockRemoteOutputDataManager :WeatherListRemoteDataManagerOutputProtocol {
    
    var mock_onRetrieved_calls = 0
    var mock_onError_calls = 0
    
    func onRetrieved(weatherModel: WeatherApp.WeatherModel) {
        mock_onRetrieved_calls += 1
    }
    
    func onError() {
        mock_onError_calls += 1
    }
}
