//
//  WeatherListInteractor.swift
//  WeatherApp
//
//  Created by MANISH PATHAK
//

import Quick
import Nimble

@testable import WeatherApp

class WeatherListInteractorSpec: QuickSpec {
    var weatherListInteractor: WeatherListInteractor?
    
    private func setupModule(){
        //        let mockLocalDataManager = MockLocalDataManager()
        let mockRemoteDataManager  = MockRemoteDataManager()
        let mockListPresenter = MockListPresenter()
        
        self.weatherListInteractor = WeatherListInteractor()
        self.weatherListInteractor?.remoteDatamanager = mockRemoteDataManager
        self.weatherListInteractor?.presenter = mockListPresenter
    }
    
    override func spec() {
        describe("WeatherListInteractor") {
            context("when app starts fetching the weathers", {
                beforeEach {
                    self.setupModule()
                }
                context("when API call is made") {
                    context("and in case existing api going on") {
                        beforeEach {
                            let remote = self.weatherListInteractor?.remoteDatamanager as? MockRemoteDataManager
                            remote?.isAPICallInProgress = true
                            self.weatherListInteractor?.retrieveWeatherList()
                        }
                        
                        it("should not API Call") {
                            let remote = self.weatherListInteractor?.remoteDatamanager as? MockRemoteDataManager
                            expect(remote?.mock_retrieveWeatherList_calls).to(equal(0))
                        }
                    }
                    
                    context("and in case there is not previous API call made") {
                        beforeEach {
                            let remote = self.weatherListInteractor?.remoteDatamanager as? MockRemoteDataManager
                            remote?.isAPICallInProgress = false
                            self.weatherListInteractor?.retrieveWeatherList()
                        }
                        
                        it("should API call and retrieve weather list") {
                            let remote = self.weatherListInteractor?.remoteDatamanager as? MockRemoteDataManager
                            expect(remote?.mock_retrieveWeatherList_calls).to(equal(1))
                        }
                    }
                    
                    
                    context("and app fetches the data from server") {
                        context("and data is retrieved") {
                            beforeEach {
                                self.weatherListInteractor?.onRetrieved(weathers: JSONUtil.getWeathers())
                            }
                            it("should return the data") {
                                let presenter = self.weatherListInteractor?.presenter as? MockListPresenter
                                expect(presenter?.mock_didRetrieveWeather_calls).to(equal(1))
                            }
                        }
                        
                        context("and there is an error occured") {
                            beforeEach {
                                self.weatherListInteractor?.onError()
                            }
                            it("should show error if there is no data") {
                                let presenter = self.weatherListInteractor?.presenter as? MockListPresenter
                                expect(presenter?.mock_didRetrieveWeather_calls).to(equal(0))
                            }
                        }
                    }
                }
            })
        }
    }
}
