//
//  MockWeatherListPresenter.swift
//  WeatherAppTests
//
//  Created by MANISH PATHAK
//

@testable import WeatherApp

class MockWeatherListPresenter: WeatherListPresenterProtocol {
    
    var view: WeatherListViewProtocol?
    var interactor: WeatherListInteractorInputProtocol?
    var router: WeatherListRouterProtocol?
    
    var mock_viewDidLoad_calls = 0
    var mock_retrieveWeatherList_calls = 0
    var mock_showMap_calls = 0
    
    func viewDidLoad() {
        mock_viewDidLoad_calls += 1
    }
    
    func retrieveWeatherData(onLaunch: Bool, searchedText: String) {
        mock_retrieveWeatherList_calls += 1
    }
}
