//
//  WeatherListPresenter.swift
//  WeatherApp
//
//  Created by MANISH PATHAK
//

import Quick
import Nimble

@testable import WeatherApp

class WeatherListPresenterSpec: QuickSpec {
    
    var weatherListPresenter: WeatherListPresenter?
    
    var view: WeatherListViewProtocol?
    var interactor: WeatherListInteractorInputProtocol?
    var router: WeatherListRouterProtocol?
    
    private func setupModule(){
        let mockView = MockWeatherListViewController()
        mockView.presenter = self.weatherListPresenter
        let mockWeatherListInteractor  = MockWeatherListInteractor()
        let mockWeatherListRouter = MockWeatherListRouter()
        
        self.weatherListPresenter = WeatherListPresenter()
        self.weatherListPresenter?.view = mockView
        self.weatherListPresenter?.interactor = mockWeatherListInteractor
        self.weatherListPresenter?.router = mockWeatherListRouter
    }

    override class func spec() {
        describe("WeatherListPresenter") {
            context("when application loads first time", closure: {
                beforeEach {
                    self.setupModule()
                }
                context("and when internet is available") {
                    context("and when view didload methods call ") {
                        beforeEach {
                            self.weatherListPresenter?.reachability = MockReachability(mockAvailablity: true)
                            self.weatherListPresenter?.viewDidLoad()
                        }
                        
                        it("it should fetch the data and show on the listview") {
                            let mockView = self.weatherListPresenter?.interactor as? MockWeatherListInteractor
                            expect(mockView?.mock_retrieveWeatherList_calls).to(equal(1))
                        }
                    }
                    
                    context("when start fetching the data") {
                        beforeEach {
                            self.weatherListPresenter?.reachability = MockReachability(mockAvailablity: true)
                            self.weatherListPresenter?.retrieveWeatherList(onLaunch: false)
                        }
                        
                        it("should API call and retrive weather list") {
                            let mockView = self.weatherListPresenter?.interactor as? MockWeatherListInteractor
                            expect(mockView?.mock_retrieveWeatherList_calls).toEventually(equal(1), timeout: DispatchTimeInterval.seconds(2))
                            
                            expect(mockView?.mock_retrieveWeatherList_calls).to(equal(1))
                        }
                    }
                }
                
                context("and when internet is not available") {
                    context("and when view didload methods call ") {
                        beforeEach {
                            self.weatherListPresenter?.reachability = MockReachability(mockAvailablity: false)
                            self.weatherListPresenter?.viewDidLoad()
                        }
                        
                        it("it should show no internet available") {
                           let mockView = self.weatherListPresenter?.view as? MockWeatherListViewController
                            
                           expect(mockView?.mock_showNoInternet_calls).to(equal(0))
                        }
                    }
                }
                
                context("when there is an error occured") {
                    beforeEach {
                        self.weatherListPresenter?.interactor?.presenter?.onError()
                    }
                    
                    it("should show error alert") {
                        let mockView = self.weatherListPresenter?.view as? MockWeatherListViewController
                        expect(mockView?.mock_showErrors_calls).to(equal(0))
                    }
                }
            })
        }
    }
}

class MockWeatherListInteractor: WeatherListInteractorInputProtocol {
    
    var presenter: WeatherListInteractorOutputProtocol?
    var remoteDatamanager: WeatherListRemoteDataManagerInputProtocol?
    
    var mock_retrieveWeatherList_calls = 0
    func retrieveWeatherList() {
        mock_retrieveWeatherList_calls += 1
    }
}

class MockWeatherListRouter: WeatherListRouterProtocol {
    
    static func make() -> UIViewController {
        return UIViewController()
    }
}

class MockWeatherModel {
    class func create() -> WeatherModel{
        let model = WeatherModel.init(byline: "By Maggie Haberman", title: "Trump Floats Improbable Survival Scenarios ", type: "Weather", updated: "2020-11-13 19:05:32")
        return model
    }
}
