//
//  WeatherListRouter.swift
//  WeatherApp
//
//  Created by MANISH PATHAK
//
//
import Quick
import Nimble

@testable import WeatherApp

class WeatherListRouterSpec: QuickSpec {
    
    var weatherListRouter: WeatherListRouter?
    var weathers: [WeatherModel]?
    var mockWeatherListVC: WeatherListViewController?
    
    override func spec() {
        describe("WeatherListRouter") {
            
            context("when screen is navigated from WeatherList") {
                beforeEach {
                    self.weathers = JSONUtil.getWeathers()
                    self.mockWeatherListVC = WeatherListViewController.stub(model: self.weathers!)
                    self.weatherListRouter = WeatherListRouter()
                }
                
                it("should present the Screen") {
                    expect(self.mockWeatherListVC?.navigationController?.viewControllers.count).to(equal(1))
                }
            }
        }
    }
}
