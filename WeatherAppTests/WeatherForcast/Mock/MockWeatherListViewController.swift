//
//  MockWeatherListViewController.swift
//  WeatherAppTests
//
//  Created by MANISH PATHAK
//

@testable import WeatherApp

class MockWeatherListViewController :WeatherListViewProtocol {
    
    var presenter: WeatherListPresenterProtocol?
    
    var mock_showDeliveries_calls = 0
    var mock_showErrors_calls = 0
    var mock_showLoading_calls = 0
    var mock_hideLoading_calls = 0
    var mock_showNoInternet_calls = 0
    var mock_loadingState_calls = 0
    var mock_LoadingState_calls = 0
    var mock_noMoreDataAvailable_Calls = 0
    
    func show(weatherModel: WeatherApp.WeatherModel) {
        mock_showDeliveries_calls += 1
    }
    
    func showError() {
        mock_showErrors_calls += 1
    }
    
    func showLoading() {
        mock_showLoading_calls += 1
    }
    
    func hideLoading() {
        mock_hideLoading_calls += 1
    }
    
    func showNoInternet() {
        mock_showNoInternet_calls += 1
    }
    
    func loadingState() -> Bool! {
        return false
        //        mock_LoadingState_calls += 1
    }
    
    func setLoadingState(_ loading: Bool) {
        mock_LoadingState_calls += 1
    }
    
    func noMoreDataAvailable() {
        mock_noMoreDataAvailable_Calls += 1
    }
    
}
