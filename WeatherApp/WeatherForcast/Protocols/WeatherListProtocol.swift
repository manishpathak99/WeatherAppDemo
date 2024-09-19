//
//  WeatherListViewProtocol.swift
//  WeatherApp
//
//  Created by MANISH PATHAK
//

import UIKit

protocol WeatherListViewProtocol: InternetAvailablityProtocol, RequestLoadingProtocol {
    var presenter: WeatherListPresenterProtocol? { get set }

    // PRESENTER -> VIEW
    func show(weatherModel: WeatherModel)
    func showError()
    func noMoreDataAvailable()
}

protocol WeatherListRouterProtocol: class {
    static func make() -> UIViewController
    // PRESENTER -> ROUTER
}

protocol WeatherListPresenterProtocol: class {
    var view: WeatherListViewProtocol? { get set }
    var interactor: WeatherListInteractorInputProtocol? { get set }
    var router: WeatherListRouterProtocol? { get set }

    // VIEW -> PRESENTER
    func viewDidLoad()
    func retrieveWeatherData(onLaunch: Bool, searchedText: String)
}

protocol WeatherListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveWeather(_ weatherModel: WeatherModel)
    func onError()
}

protocol WeatherListInteractorInputProtocol: class {
    var presenter: WeatherListInteractorOutputProtocol? { get set }
    var remoteDatamanager: WeatherListRemoteDataManagerInputProtocol? { get set }

    // PRESENTER -> INTERACTOR
    func retrieveWeatherData(city: String)
}

protocol InternetAvailablityProtocol: class {
    func showNoInternet()
}

protocol RequestLoadingProtocol: class {
    func showLoading()
    func hideLoading()
    func loadingState() -> Bool!
    func setLoadingState(_ loading: Bool)
}
