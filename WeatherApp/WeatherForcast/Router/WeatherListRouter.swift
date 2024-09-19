//
//  WeatherListRouter.swift
//  WeatherApp
//
//  Created by MANISH PATHAK
//

import UIKit

class WeatherListRouter: WeatherListRouterProtocol {
    
    class func make() -> UIViewController {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let destViewController = mainStoryboard.instantiateViewController(withIdentifier: "WeatherListViewController")
        let navigationController = UINavigationController(rootViewController: destViewController)
        if let view = navigationController.children.first as? WeatherListViewController {
            let presenter: WeatherListPresenterProtocol & WeatherListInteractorOutputProtocol = WeatherListPresenter()
            let interactor: WeatherListInteractorInputProtocol & WeatherListRemoteDataManagerOutputProtocol = WeatherListInteractor()
            let remoteDataManager: WeatherListRemoteDataManagerInputProtocol = WeatherListRemoteDataManager()
            let router: WeatherListRouterProtocol = WeatherListRouter()
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            return navigationController
        }
        return UIViewController()
    }
}
