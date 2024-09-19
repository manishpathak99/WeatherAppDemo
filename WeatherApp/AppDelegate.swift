//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by manishpathak on 19/09/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let router = WeatherListRouter.make()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = router
        window?.makeKeyAndVisible()
        return true
    }
}

