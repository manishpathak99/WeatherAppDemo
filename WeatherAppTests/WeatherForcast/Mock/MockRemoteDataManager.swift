//
//  MockListPresenter.swift
//  WeatherAppTests
//
//  Created by MANISH PATHAK
//

@testable import WeatherApp

class MockRemoteDataManager :WeatherListRemoteDataManagerInputProtocol {
    
    

    var remoteRequestHandler: WeatherListRemoteDataManagerOutputProtocol?
    var mock_retrieveWeatherList_calls = 0
    
    var isAPICallInProgress: Bool?

    func retrieveWeatherData(city: String) {
        mock_retrieveWeatherList_calls += 1
    }
}
