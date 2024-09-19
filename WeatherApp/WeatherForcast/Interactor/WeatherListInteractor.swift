//
//  WeatherListInteractor.swift
//  WeatherApp
//
//  Created by MANISH PATHAK
//

class WeatherListInteractor: WeatherListInteractorInputProtocol {
    
    var presenter: WeatherListInteractorOutputProtocol?
    var remoteDatamanager: WeatherListRemoteDataManagerInputProtocol?
    var offset = 0
    
    func retrieveWeatherData(city: String) {
        if remoteDatamanager?.isAPICallInProgress ?? false {
            return
        }
        remoteDatamanager?.retrieveWeatherData(city: city)
    }
}

extension WeatherListInteractor: WeatherListRemoteDataManagerOutputProtocol {
    
    func onRetrieved(weatherModel: WeatherModel) {
        presenter?.didRetrieveWeather(weatherModel)
    }
    
    func onError() {
        presenter?.onError()
    }
}
