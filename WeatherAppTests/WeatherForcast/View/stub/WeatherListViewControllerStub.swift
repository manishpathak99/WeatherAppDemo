//
//  WeatherListViewControllerStub.swift
//  WeatherApp
//
//  Created by Manish Pathak
//

import UIKit

@testable import WeatherApp

extension WeatherListViewController {
    static func stub(model: [WeatherModel]) -> WeatherListViewController {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        if let viewController: WeatherListViewController = mainStoryboard.instantiateViewController(withIdentifier: "WeatherListViewController") as? WeatherListViewController {
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.makeKeyAndVisible()
            let navigationController = UINavigationController(rootViewController: viewController)
            window.rootViewController = navigationController
            viewController.weatherList = model
            return viewController
        }
        return WeatherListViewController()
    }
}
