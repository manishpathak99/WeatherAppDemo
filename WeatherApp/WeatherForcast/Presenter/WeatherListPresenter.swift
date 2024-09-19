//
//  WeatherListPresenter.swift
//  WeatherApp
//
//  Created by MANISH PATHAK
//

import Foundation
class WeatherListPresenter: WeatherListPresenterProtocol {
    
    var view: WeatherListViewProtocol?
    var interactor: WeatherListInteractorInputProtocol?
    var router: WeatherListRouterProtocol?
    var reachability: ReachabilityProtocol = NetworkReachability.shared()
    
    func viewDidLoad() {
        retrieveWeatherData(onLaunch: true, searchedText: Constants.Search.defaultText)
    }
    
    func retrieveWeatherData(onLaunch: Bool, searchedText: String) {
        
        if reachability.isInternetAvailable() {
            if view?.loadingState() ?? false {
                return
            }
            view?.setLoadingState(true)
            if onLaunch {
                view?.showLoading()
            }
            interactor?.retrieveWeatherData(city: searchedText)
        } else {
            view?.setLoadingState(true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                self?.view?.setLoadingState(false)
                self?.view?.showNoInternet()
                return
            }
        }
    }
}

extension WeatherListPresenter: WeatherListInteractorOutputProtocol {

    func didRetrieveWeather(_ weatherModel: WeatherModel) {
        view?.show(weatherModel: weatherModel)
        view?.setLoadingState(false)
    }
    
    func onError() {
        view?.showError()
        view?.setLoadingState(false)
    }
}
