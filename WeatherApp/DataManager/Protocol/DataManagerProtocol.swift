//
//  DataManagerProtocol.swift
//  WeatherApp
//
//  Created by MANISH PATHAK
//

protocol WeatherListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: WeatherListRemoteDataManagerOutputProtocol? { get set }
    var isAPICallInProgress: Bool? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveWeatherData(city: String)
}

protocol WeatherListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol WeatherListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onRetrieved(weatherModel: WeatherModel)
    func onError()
}
