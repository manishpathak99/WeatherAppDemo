//
//  WeatherListViewController.swift
//  WeatherApp
//
//  Created by MANISH PATHAK
//

import UIKit
import Quick
import Nimble

@testable import WeatherApp

class WeatherListViewControllerSpec: QuickSpec {
    var weatherListVC: WeatherListViewController?

    private func setupModule(){
        self.weatherListVC = WeatherListViewController.stub(model: JSONUtil.getWeathers())
        
        let mockPresenter = MockWeatherListPresenter()
        weatherListVC?.presenter = mockPresenter
    }
    
    override func spec() {
        describe("WeatherListViewController") {
            context("when view is loaded", {
                beforeEach {
                    self.setupModule()
                }
                
                context("and when view didload methods call ") {
                    beforeEach {
                        self.weatherListVC?.viewDidLoad()
                    }
                    it("it should fetch the data and show on the listview") {
                        let mockPresenter = self.weatherListVC?.presenter as? MockWeatherListPresenter
                        expect(mockPresenter?.mock_viewDidLoad_calls).to(equal(1))
                    }
                }
                
                context("and when loadView is called") {
                    beforeEach {
                        self.weatherListVC?.loadView()
                    }
                    
                    it("should add tableview in view") {
                        expect(self.weatherListVC?.tableView).notTo(beNil())
                    }
                }
                
                context("and when making api call first time and it returns response") {
                    beforeEach {
                        self.weatherListVC?.handlePullToRefresh(UIView())
                    }
                    
                    it("should show weathers in tableview") {
                        expect(self.weatherListVC?.loadingState()).toEventually(beFalse(), timeout: DispatchTimeInterval.seconds(7))
                        self.weatherListVC?.loadView()
                        expect(self.weatherListVC?.tableView?.numberOfRows(inSection: 0) ?? 0 > 0).toEventually(beTrue(), timeout: DispatchTimeInterval.seconds(7))
                        expect(self.weatherListVC?.loadingState()).toEventually(beFalse(), timeout: DispatchTimeInterval.seconds(7))
                    }
                }
                
                context("and when List scrolled to bottom") {
                    beforeEach {
                        self.weatherListVC?.loadView()
                        self.weatherListVC?.isLoading = false
//                        self.weatherListVC?.tableView(self.weatherListVC!.tableView, willDisplay: UITableViewCell(), forRowAt: IndexPath(row: 9, section: 0))
                    }
                    
                    it("it should show the bottom loader") {
                        expect(self.weatherListVC?.tableView.tableFooterView).notTo(beNil())
                    }
                }
                
                context("and when bottom loader is showing") {
                    beforeEach {
                        self.weatherListVC?.loadView()
                        self.weatherListVC?.showBottomLoader()
                    }
                    
                    it("it should attach to view") {
                        expect(self.weatherListVC?.tableView.tableFooterView).notTo(beNil())
                    }
                }
                
                context("and when loader is showing") {
                    var count = 0
                    beforeEach {
                        count = self.weatherListVC?.view.subviews.count ?? 0
                        self.weatherListVC?.showLoading()
                    }
                    
                    it("it should attach to view and increased the count by 1") {
                        expect(self.weatherListVC?.view.subviews.count).to(equal(count + 1))
                    }
                }
                
                context("and when Deliveries are fetched and ready to show") {
                    beforeEach {
                        self.weatherListVC?.loadView()
                        let weathers = JSONUtil.getWeathers()
                        self.weatherListVC?.show(weathers: weathers)
                    }
                    
                    it("it should show weathers in tableView") {
                         expect(self.weatherListVC?.tableView?.numberOfRows(inSection: 0) ?? 0 > 0).toEventually(beTrue(), timeout: DispatchTimeInterval.seconds(5))
                        expect(self.weatherListVC?.loadingState()).toEventually(beFalse(), timeout: DispatchTimeInterval.seconds(5))
                    }
                }
                
                context("and when loader is hiding") {
                    beforeEach {
                        self.weatherListVC?.hideLoading()
                    }
                    
                    it("it should have view's UserInteraction to be true") {
                        expect(self.weatherListVC?.view.isUserInteractionEnabled).to(beTrue())
                    }
                }
                
                context("and when there is an error") {
                    beforeEach {
                        self.weatherListVC?.showError()
                    }
                    
                    it("should show error alert") {
                        expect(self.weatherListVC?.presentedViewController?.isKind(of: UIAlertController.self)).toEventually(beTrue(), timeout: DispatchTimeInterval.seconds(5))
                    }
                }

                context("and when there is no Internet") {
                    beforeEach {
                        self.weatherListVC?.showNoInternet()
                    }
                    
                    it("should show noInternet alert") {
                        expect(self.weatherListVC?.presentedViewController?.isKind(of: UIAlertController.self)).toEventually(beTrue(), timeout: DispatchTimeInterval.seconds(5))
                    }
                }
                context("and when there is no More Data") {
                    beforeEach {
                        self.weatherListVC?.noMoreDataAvailable()
                    }
                    
                    it("should show alert") {
                        expect(self.weatherListVC?.presentedViewController?.isKind(of: UIAlertController.self)).toEventually(beTrue(), timeout: DispatchTimeInterval.seconds(5))
                    }
                }
                
            })
        }
    }
}
