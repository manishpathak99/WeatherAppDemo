//
//  ReachableMock.swift
//  WeatherAppTests
//
//  Created by MANISH PATHAK
//

@testable import WeatherApp

class MockReachability: ReachabilityProtocol {
    var mockAvailablity = false
    init(mockAvailablity: Bool) {
        self.mockAvailablity = mockAvailablity
    }
    
    func isInternetAvailable() -> Bool {
        return mockAvailablity
    }
}
